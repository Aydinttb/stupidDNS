#!/usr/bin/env bash

#--- enable warp plus in proxy mode
endpoint_IP="188.114.99.228"
endpoint_PORT="8886"

function CONN_RESET {
	kill -9 $(pidof /usr/bin/tun2proxy-bin) 2>/dev/null || true
	kill -9 $(pidof /usr/bin/warp-plus) 2>/dev/null || true
	sleep 2
	warp-plus --endpoint $endpoint_IP:$endpoint_PORT -4 >/var/log/warp_output.log &
}

function handle_failed_attempts {
	echo "Failed to get valid country code after 10 attempts - calling recovery function"
	CONN_RESET
}

function start_script {
	echo "nameserver 1.1.1.1" >/etc/resolv.conf
	echo "Waiting 5 seconds before initial check..."

	warp-plus --endpoint $endpoint_IP:$endpoint_PORT -4 >/var/log/warp_output.log &

	local attempt_count=0
	local max_attempts=10

	while true; do
		response=$(curl -s --socks5 127.0.0.1:8086 --connect-timeout 10 ip-api.com)
		country=$(echo "$response" | awk '/countryCode/ {gsub(/[^A-Z]/,"",$3); print $3}')

		if [ -z "$country" ]; then
			echo "Debug: Country code extracted: '${country}'"
			((attempt_count++))

			if [ $attempt_count -ge $max_attempts ]; then
				handle_failed_attempts
				attempt_count=0
			fi

			sleep 5
			continue
		fi

		attempt_count=0

		if [ "$country" = "IR" ]; then
			echo "Iran detected - taking action"
			CONN_RESET
			sleep 5
		else
			echo "Country is ${country} - breaking loop"
			break
		fi

		sleep 5
	done
}

start_script

#--- setup tunnel for warp proxy

function UP_TUNNEL {
	tun2proxy-bin --setup --proxy socks5://127.0.0.1:8086 \
		--bypass $endpoint_IP --bypass 192.168.0.0/16 \
		--bypass 172.16.0.0/12 --bypass 10.0.0.0/8 &>/var/log/tun2proxy.log &
}

UP_TUNNEL

#--- connection monitor and auto reatart
function CONN_kill {
	kill -9 $(pidof /usr/bin/tun2proxy-bin) 2>/dev/null || true
	echo "tun killed"
	kill -9 $(pidof /usr/bin/warp-plus) 2>/dev/null || true
	echo "proxy killed"
}

function on_connection_lost {
	CONN_kill
	start_script
	UP_TUNNEL
}

function connection_monitor {
	TARGET="https://www.google.com"
	TIMEOUT=90
	CHECK_INTERVAL=5
	failed_count=0

	while true; do
		if curl --silent --head --fail --max-time 5 $TARGET &>/dev/null; then
			if [ $failed_count -gt 0 ]; then
				echo "$(date): Connection to Google restored!" >>/var/log/connection.log
				failed_count=0
			fi
		else
			((failed_count++))
			echo "$(date): Connection check failed - Attempt $failed_count" >>/var/log/connection.log

			if [ $failed_count -ge $((TIMEOUT / CHECK_INTERVAL)) ]; then
				on_connection_lost
				failed_count=0
			fi
		fi

		sleep $CHECK_INTERVAL
	done
}

connection_monitor &

#----
exec nginx -g "daemon off;"

# stupidDNS
A smart DNS to resolve 403 issues for Iran using Cloudflare Warp.

![2025-04-14-002738_hyprshot](https://github.com/user-attachments/assets/3f14c848-6369-4d11-a2f2-632dbf192b30)


---

### درباره
این پروژه با استفاده از nginx, dnsmasq, warp-plus, tun2proxy سرویسی روی لوکال شما ستاپ میکند که کاربرد آن مانند dns های تحریم شکن است ولی نیاز به سرور ندارد و تمام چیزی که نیاز دارد کانتینر ران تایم داکر برای اجرای دو کانتینر می باشد ،همچنین کانتینر nginx دسترسی به اینترنت آزاد دارد ،میتواند شمارا به منابع فیلتر شده نیز وصل کند و درحال حاضر موراد پرکاربرد مانند youtube , spotify , reddit .... رو توش گزاشتم ولی اینکه چجوری خودتون دامنه مورد نیازتون رو به این سرویس اضافه کنید در ادامه نوشته شده است.

### stupidDNS.local 
این سرویس برای استفاده در سیستم لوکال طراحی شده است و در صورتی که dns-proxy فقط در سطح لوکال نیاز دارید و نیاز ندارید که در سطح شبکه قابل استفاده باشد پیشنهاد می شود از این سرویس استفاده کنید تا هیچ پورتی از نتورک سیستم شما درگیر نباشد و راهنمای استفاده در دایرکتوری  stupidDNS.local وجود دارد .

### stupidDNS
این سرویس برای استفاده در سطح شبکه طراحی شده است و در صورتی که نیاز دارید سرویس در سطح شبکه قابل دسترسی و استفاده باشد پیشنهاد می شود از این سرویس استفاده کنید و راهنمای استفاده از آن در دایرکتوری stupidDNS موجود است




stupidDNS is a smart DNS solution that helps resolve 403 issues for users in Iran by utilizing Cloudflare Warp. It sets up a local service using nginx, dnsmasq, warp-plus, and tun2proxy, allowing users to access blocked resources without the need for a dedicated server.

## Main Function Points
- Provides a DNS-based solution to bypass internet censorship in Iran
- Utilizes Cloudflare Warp to access blocked resources
- Runs as a Docker container, making it easy to set up and use
- Offers two versions: `stupidDNS.local` for local use and `stupidDNS` for network-wide access

## Technology Stack
- nginx
- dnsmasq
- warp-plus
- tun2proxy
- Docker


---
thanks [ Morteza Farkhondepour](https://www.linkedin.com/in/morteza-farkhondepour/) for this idea

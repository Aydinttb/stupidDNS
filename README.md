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

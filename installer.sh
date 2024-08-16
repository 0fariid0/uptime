#!/bin/bash

# دانلود اسکریپت اصلی از مخزن GitHub
curl -O https://raw.githubusercontent.com/0fariid0/uptime/main/uptime_kuma_manager.sh

# صادر کردن مجوز اجرای اسکریپت
chmod +x uptime_kuma_manager.sh

echo "اسکریپت دانلود و آماده اجرا است."
echo "برای اجرای اسکریپت از دستور زیر استفاده کنید:"
echo "./uptime_kuma_manager.sh"

# اجرای خودکار اسکریپت اصلی
./uptime_kuma_manager.sh

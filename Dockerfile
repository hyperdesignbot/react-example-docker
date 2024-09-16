# مرحله 1: استفاده از تصویر پایه Node.js برای ساخت پروژه
FROM node:14 AS build

# تنظیم دایرکتوری کاری
WORKDIR /app

# کپی فایل‌های package.json و package-lock.json به دایرکتوری کاری
COPY package.json .
COPY package-lock.json .

# نصب وابستگی‌ها (این مرحله کش می‌شود تا وقتی که package.json و package-lock.json تغییر نکند)
RUN npm install

# کپی کد منبع به دایرکتوری کاری
COPY . .

# ساخت نسخه تولیدی اپلیکیشن
RUN npm run build

# مرحله 2: استفاده از Nginx برای سرو کردن اپلیکیشن
FROM nginx:alpine

# کپی نسخه تولیدی اپلیکیشن از مرحله ساخت به دایرکتوری Nginx
COPY --from=build /app/build /usr/share/nginx/html

# مشخص کردن پورت 80 برای Nginx
EXPOSE 80

# شروع به کار Nginx
CMD ["nginx", "-g", "daemon off;"]

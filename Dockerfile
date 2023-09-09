# Menggunakan image nodejs versi 14 serta spesifik menggunakan alpine linux
FROM node:14-alpine3.17

# Membuat serta menentukan working directory yaitu /app
WORKDIR /app

# Menyalin semua berkas yang berada satu folder dengan Dockerfile ke current directory yaitu /app sebagai workdir
COPY . .

# Menambahkan environemtn variable berupa NODE_ENV dan DB_HOST, environment variable bisa dilihat menggunakan command 'env' didalam container
ENV NODE_ENV=production

# Menjalankan perintah npm install untuk menginstall production dependencies dan melakukan bypass permission saat melakukan pengecekan packages
RUN npm install --production --unsafe-perm

# Perintah yang akan dijalankan saat container berjalan
CMD [ "npm", "start" ]
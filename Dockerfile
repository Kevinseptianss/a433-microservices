# Menggunakan base image Node.js versi 14
FROM node:14

# Menentukan working directory untuk container
WORKDIR /app

# Menyalin source code ke directory container
COPY . .

# Menentukan enviroment variables untuk production mode dan database host
ENV NODE_ENV=production
ENV DB_HOST=item-db 

# Menginstal dependencies untuk production dan kemudian build aplikasi
RUN npm install --production --unsafe-perm && npm run build

# Expose port yang di gunakan aplikasi
EXPOSE 8080

# Menjalankan NPM Start
CMD ["npm", "start"]
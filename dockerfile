FROM node:14 as builder
WORKDIR /app
COPY package.json .
RUN npm install
COPY . .
RUN npm RUN build

FROM nginx          
EXPOSE 80
COPY --from=builder /app/build /user/share/nginx/html


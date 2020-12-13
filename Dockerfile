FROM node:alpine as builder

WORKDIR '/app'

COPY package.json .

RUN npm install

COPY . .

RUN npm run build

# /app/build 폴더에 모두 저장된다.

FROM nginx

EXPOSE 80

COPY --from=builder /app/build /usr/share/nginx/html


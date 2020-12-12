FROM node:alpine as builder

WORKDIR '/app'

COPY package.json .

RUN npm install

COPY . .

RUN npm run build

# /app/build 폴더에 모두 저장된다.

FROM nginx

COPY --from=builder /app/build /usr/share/nginx/html

# docker build .
# docker run -p 8080:80 bb02462055e9


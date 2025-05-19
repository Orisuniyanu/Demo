FROM nginx

RUN apk update && apk upgrade && apk add curl vim sudo

RUN apk update && apk upgrade

RUN rm -rf /var/lib/apt/lists/*

COPY 2127_little_fashion /usr/share/nginx/html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
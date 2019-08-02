FROM nginx
WORKDIR /tmp/web/container
COPY ./ /usr/share/nginx/html

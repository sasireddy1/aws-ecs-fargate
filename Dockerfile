FROM ubuntu:latest
RUN apt update && apt upgrade && apt install -y nginx

#config
#copy ./ /etc/nginx/nginx.conf

#content,
copy ./shine /var/www/html/
#copy ./*.css /usr/share/nginx/html/
#copy ./*.png /usr/share/nginx/html/
#copy ./*.js /usr/share/nginx/html/
CMD service nginx restart
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]

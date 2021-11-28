FROM ubuntu:20.04
RUN apt update -y
RUN apt install nginx -y
RUN apt install net-tools -y
RUN apt install wget -y
RUN unlink /etc/nginx/sites-enabled/default
RUN wget https://testbuck11111.s3.ap-south-1.amazonaws.com/myweb.conf
RUN cp -r myweb.conf /etc/nginx/conf.d
RUN nginx -t
RUN mkdir /var/www/html/myweb
RUN wget https://testbuck11111.s3.ap-south-1.amazonaws.com/myweb.tar.gz
RUN tar -xvzf myweb.tar.gz
RUN cp -r myweb/. /var/www/html/myweb/
ENTRYPOINT ["nginx"]
CMD ["-g", "daemon off;"]

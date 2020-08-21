FROM devopsedu/webapp

RUN rm -rf /var/www/html/*
COPY webapp/website /var/www/html
RUN ls -l /var/www/html
CMD ["apachectl", "-D", "FOREGROUND"]
EXPOSE 80

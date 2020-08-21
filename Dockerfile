FROM devopsedu/webapp

RUN rm -rf /var/www/html/webapp 
COPY webapp /var/www/html/webapp 
RUN ls -l /var/www/html
RUN sed -i 's/\/var\/www\/html$/\/var\/www\/html\/webapp\/website/g' /etc/apache2/sites-available/000-default.conf
CMD ["apachectl", "-D", "FOREGROUND"]
EXPOSE 80

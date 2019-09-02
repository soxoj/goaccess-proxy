FROM allinurl/goaccess AS goaccess
FROM nginx

RUN unlink /var/log/nginx/access.log

COPY --from=goaccess /bin/goaccess /bin/
COPY --from=goaccess /usr/share/zoneinfo /usr/share/zoneinfo
COPY goaccess.conf /root/.goaccessrc
COPY nginx.conf /etc/nginx/
COPY www /var/www/verify

CMD nginx; /bin/goaccess -a -f /var/log/nginx/access.log

FROM allinurl/goaccess AS goaccess
FROM nginx

RUN unlink /var/log/nginx/access.log
RUN unlink /var/log/nginx/error.log

COPY --from=goaccess /bin/goaccess /bin/
COPY --from=goaccess /usr/share/zoneinfo /usr/share/zoneinfo
COPY goaccess.conf /root/.goaccessrc

EXPOSE 80
EXPOSE 7890

CMD nginx; /bin/goaccess -a -f /var/log/nginx/access.log

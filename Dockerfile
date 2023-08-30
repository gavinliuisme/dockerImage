FROM busybox-extras
CMD ["/bin/sh"]

COPY www /www

ENTRYPOINT ["/bin/busybox-extras httpd -p 80 -h /www"]

FROM nginx
CMD ["/bin/sh"]
RUN /bin/sh -c set -ex   && apk add --update --no-cache      sqlite unzip bash curl gzip ripgrep busybox-extras nginx jq tzdata   && cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && echo "Asia/Shanghai" > /etc/timezone && apk del tzdata   && rm -rf /tmp/* /var/cache/apk/*   && mv /usr/bin/rg /bin/grep # buildkit

COPY www /www

ENTRYPOINT ["/bin/busybox-extras httpd -p 80 -h /www"]

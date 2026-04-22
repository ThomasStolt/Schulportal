FROM nginx:alpine
# envsubst (aus gettext) ist in nginx:alpine bereits enthalten
COPY index.html /usr/share/nginx/html/index.html.template
COPY nginx.conf /etc/nginx/conf.d/default.conf
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

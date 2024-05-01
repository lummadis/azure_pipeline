FROM alpine

RUN apk add -U curl privoxy jq && \
    mv /etc/privoxy/templates /etc/privoxy-templates && \
    rm -rf /var/cache/apk/* /etc/privoxy/* && \
    mv /etc/privoxy-templates /etc/privoxy/templates

ADD k8s-api-proxy.sh /

EXPOSE 8118/tcp

ENTRYPOINT ["./k8s-api-proxy.sh"]
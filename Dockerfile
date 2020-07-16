FROM alpine
RUN apk add --no-cache easy-rsa \
  && ln -s /usr/share/easy-rsa/easyrsa /usr/local/bin


ENV SERVER_NAME=localhost \
  CERTIFICATE_ARN= \
  EASYRSA=/usr/share/easy-rsa \
  EASYRSA_PKI=/var/lib/easy-openvpn/pki \
  EASYRSA_CERT_EXPIRE=3650

COPY  entrypoint.sh /usr/local/bin/
CMD ["/usr/local/bin/entrypoint.sh"]

#!/bin/sh -e

mkdir -p ${EASYRSA_PKI}

easyrsa --batch init-pki 1>&2
easyrsa --batch build-ca nopass 1>&2
easyrsa --batch build-server-full "${SERVER_NAME}" nopass 1>&2

CA_CERT=$(cat "${EASYRSA_PKI}/ca.crt" | base64 | tr -d '\n')
SERVER_CERT=$(openssl x509 -in "${EASYRSA_PKI}/issued/${SERVER_NAME}.crt" | base64 | tr -d '\n')
SERVER_KEY=$(cat "${EASYRSA_PKI}/private/${SERVER_NAME}.key" | base64 | tr -d '\n')

OPTS="--certificate '${SERVER_CERT}'"
OPTS="${OPTS} --private-key '${SERVER_KEY}'"
OPTS="${OPTS} --certificate-chain '${CA_CERT}'"

if [ "${CERTIFICATE_ARN}" != "" ];then
  OPTS="${OPTS} --certificate-arn ${CERTIFICATE_ARN}"
fi

echo "aws acm import-certificate ${OPTS}"

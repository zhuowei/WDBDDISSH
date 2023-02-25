#!/bin/sh
set -e
# macOS's LibreSSL doesn't come with a openssl.crf that supports the ca command
# Use Homebrew's instead
sed -e "s/# copy_extensions = copy/copy_extensions = copyall/" \
	/usr/local/etc/openssl/openssl.cnf >openssl.cnf
OPENSSL="/usr/local/Cellar/openssl@3/3.0.7/bin/openssl"
rm -r demoCA || true
mkdir -p demoCA/newcerts || true
echo 01 > demoCA/serial
touch demoCA/index.txt
"$OPENSSL" req -newkey rsa:1024 -keyout key.pem -out req.pem -sha256 -nodes \
	-subj "/C=CA/ST=BC/O=Worth Doing Badly/CN=Worth Doing Badly DDI" \
	-addext "basicConstraints=critical, CA:true"
"$OPENSSL" ca -batch -selfsign -keyfile key.pem -in req.pem -out cert_raw.pem -startdate 070416225531Z -enddate 140416225531Z \
	-config openssl.cnf
"$OPENSSL" x509 -in cert_raw.pem -out cert.pem

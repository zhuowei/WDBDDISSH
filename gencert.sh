#!/bin/sh
openssl req -x509 -newkey rsa:1024 -keyout key.pem -out cert.pem -sha256 -days 365 -nodes -subj "/C=CA/CN=Worth Doing Badly DDI"
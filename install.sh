#!/bin/bash

apt install cups foomatic-db-compressed-ppds printer-driver-gutenprint printer-driver-brlaser hplip libcups2-dev

mkdir /usr/src/appCups

cp cupsd.conf /usr/src/appCups/cupsd.conf

cd /usr/src/appCups

git clone https://gitlab.com/ScumCoder/splix.git

cd /usr/src/appCups/splix/splix

make DISABLE_JBIG=1 && \
make install && \
cp ./ppd/m2020.ppd /usr/share/ppd/custom

mv /etc/cups/cupsd.conf /etc/cups/cupsd.conf.old

cp /usr/src/appCups/cupsd.conf /etc/cups/cupsd.conf

service cups restart
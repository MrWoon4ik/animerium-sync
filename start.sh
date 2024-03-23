#!/bin/bash

MD5=$(md5sum .requirements.txt | cut -f1 -d' ')
if ! [ -d ".data/$MD5-site-packages" ]; then
    rm -rf .data/*-site-packages
    pip3 install -U -r .requirements.txt -t ".data/$MD5-site-packages"
fi
/usr/bin/python3 -m pip install --upgrade pip
/usr/bin/python3 -m pip install gunicorn
exec env PYTHONPATH="$PWD/.data/$MD5-site-packages" gunicorn server:app -w 1 --log-file -
#!/bin/bash

adduser $FTP_USER --disabled-password --gecos ""

echo "$FTP_USER:$FTP_PASS" | chpasswd

echo $FTP_USER >> /etc/vsftpd.userlist

chown $FTP_USER:$FTP_USER /content

vsftpd /etc/vsftpd.conf
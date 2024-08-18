#!/bin/bash

sudo -i
dnf update -y
dnf install docker
systemctl enable docker
systemctl start docker
usermod -aG docker ec2-user

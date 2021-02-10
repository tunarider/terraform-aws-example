#!/bin/bash

rm -rf ${PWD}/state

mkdir ${PWD}/state

ssh-keygen -t rsa -b 4096 -f ${PWD}/state/bastion -C bastion -N '' -q
ssh-keygen -t rsa -b 4096 -f ${PWD}/state/default -C default -N '' -q

bastion_pub=$(cat ${PWD}/state/bastion.pub)
default_pub=$(cat ${PWD}/state/default.pub)

sed -i '' "s|public_key_bastion.*|public_key_bastion = \"${bastion_pub}\"|g" terraform.tfvars
sed -i '' "s|public_key_default.*|public_key_default = \"${default_pub}\"|g" terraform.tfvars


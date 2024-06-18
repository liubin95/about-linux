#!/bin/bash
URLX="http://prod-cdn.packages.k8s.io/repositories/isv:/kubernetes:/core:/stable:/v$1"
PRIMARY=$(curl -sS $URLX/rpm/repodata/repomd.xml|grep primary.xml.gz| awk -F\" {'print $2'})

curl -sS $URLX/rpm/$PRIMARY  | gunzip - |  grep x86_64.rpm | awk -F\" {'print $(NF-1)'} | awk -F / {'print $2'}|\
 sort -t '-' -k 1,1 -k 2Vr | awk -F '-' '!seen[$1]++' |\
 awk -v x1="$1" {'print "http://prod-cdn.packages.k8s.io/repositories/isv:/kubernetes:/core:/stable:/v"x1"/rpm/x86_64/"$1'}| \
 xargs -I{} curl -LO {}
ls -lrt

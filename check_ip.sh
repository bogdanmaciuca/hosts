#!/bin/sh
filename='/etc/hosts'
while read line
do
    # AM SCHIMBAT AICI
    #
    ##
    #
    ##
    #
    [ "$line" == "" ] && break # Stop on first empty line
    words=($line)
    etc_addr=${words[0]}
    domain=${words[1]}
     # nslookup afiseaza si ipv6 cateodata
     # cum ar trebui sa parsez output-ul asa?
    addr=$(dig +short @8.8.8.8 $domain | head -n 1)
    [ "$etc_addr" != "127.0.0.1" -a "$etc_addr" != "127.0.1.1" -a "$etc_addr" != "$addr" ] && echo "Bogus IP: $etc_addr"
done < "$filename"

#Hello 

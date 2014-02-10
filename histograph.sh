#!/bin/bash

while sleep 2; do
    
currentPrice=$(curl https://coinbase.com/api/v1/currencies/exchange_rates -s | 
sed 's/,/\n/g' | 
grep 'btc_to_usd' | 
sed 's/:/\n/g' | 
grep -v 'btc_to_usd' | 
sed 's/\"//g' | 
awk '{printf("%d\n",$1 + 0.5)}';)



for ((c=0; c<=$currentPrice; c+=10));do echo -e -n "\e[00;31m=\e[00m";done

printf " $currentPrice \n"

done;

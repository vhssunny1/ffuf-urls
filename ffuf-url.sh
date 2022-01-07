target=$1;
wordlist=$2;
while read -r url;

do ffuf -w $wordlist -u $url/FUZZ -c -mc 200-299,300-399,400-403,500-599| tee ./$(echo $url | sed 's/http:\/\//dir-/g' | sed 's/https:\/\//dir-/g' | sed 's/:/\-/g').txt;

done < $target

Usage- bash ffuf-url.sh listofurls wordlist

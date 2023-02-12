#!/bin/bash
table=server_usa
image=us_flag
country=usip195
for entry in /root/*.conf
do
  response=$(curl -sb -H -F "file=@$entry" -F "table=$table" -F "image=$image" -F "country=$country" https://api.vokka.net/api/trpn/postapi.php)
  if [ $response == "success" ]; then
    filename=$(basename $entry)
    mv $entry /root/backup/$filename
  fi
  break
done

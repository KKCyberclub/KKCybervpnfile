#!/bin/bash
table=server_belgium
image=bl_flag
country=Belgium
for entry in /root/*.conf
do
  response=$(curl -sb -H -F "file=@$entry" -F "table=$table" -F "image=$image" -F "country=$country" http://51.81.216.133/vpn/postapi.php)
  if [ $response == "success" ]; then
    filename=$(basename $entry)
    mv $entry /root/backup/$filename
  fi
  break
done
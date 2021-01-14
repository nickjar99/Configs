

ip=$(ip a | grep -A2 wlan0: | grep inet | sed -e "s/.*inet //;s/\/.*//")
me=$(whoami)

echo $me@$ip
echo $me@$ip -p 8022
echo ssh $me@$ip -p 8022
echo rsync -azvhe "ssh -p 8022" --progress $me@$ip

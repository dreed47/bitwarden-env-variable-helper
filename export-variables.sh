echo "Hello All-Yall!!!!!!"
echo "input is $1"

bw sync

IFS='|' read -ra arrIN <<< "$1"
for i in "${arrIN[@]}"
do
    :
    #echo "$i"
    #echo "$i"="kkkkk" >> $GITHUB_ENV
    echo "$i="$(bw list items --search $i | jq '.[0] | .notes' -r) >> $GITHUB_ENV
done

echo "Export variables to GITHUB_ENV"
echo "input is $1"

# sync BitWarden to ensure the latest content
bw sync

IFS='|' read -ra arrIN <<< "$1"
for i in "${arrIN[@]}"
do
    :
    echo "$i<<EOF" >> $GITHUB_ENV
    bw list items --search $i | jq '.[0] | .notes' -r >> $GITHUB_ENV
    echo "EOF" >> $GITHUB_ENV

done

echo "Export variables to GITHUB_ENV"
echo "Access these variables with ${{ env.SOMEVARIABLE }}"
echo "input is $1"

# sync BitWarden to ensure the latest content
bw sync

IFS='|' read -ra arrIN <<< "$1"
for i in "${arrIN[@]}"
do
    :
    #echo "$i"
    #echo "$i"="kkkkk" >> $GITHUB_ENV
    echo "$i="$(bw list items --search $i | jq '.[0] | .notes' -r) >> $GITHUB_ENV
done

echo "Export variables to GITHUB_ENV"
echo "input is $1"

# sync BitWarden to ensure the latest content
bw sync

IFS='|' read -ra arrIN <<< "$1"
for i in "${arrIN[@]}"
do
    :
echo "$i="$(bw list items --search $i | jq '.[0] | .notes' -r) >> $GITHUB_ENV

done
    #echo "$i"
    #echo "$i=$(bw list items --search $i | jq '.[0] | .notes' -r)" >> $GITHUB_ENV
    #echo -e "$i=\n$(bw list items --search $i | jq '.[0] | .notes' -r)" >> $GITHUB_ENV
    #echo -e "$i='$(bw list items --search $i | jq '.[0] | .notes' -r)'" >> ${GITHUB_ENV}
    #printf "%s" "ID_RSA_PRIVATE="$(bw list items --search ID_RSA_PRIVATE | jq '.[0] | .notes' -r) >> testfile
    #printenv "ID_RSA_PRIVATE="$(bw list items --search ID_RSA_PRIVATE | jq '.[0] | .notes' -r) >> $GITHUB_ENV
    #printenv "$i="$(bw list items --search $i | jq '.[0] | .notes' -r) >> $GITHUB_ENV
    #echo "ID_RSA_PRIVATE=$(bw list items --search ID_RSA_PRIVATE | jq '.[0] | .notes' -r)" >> testfile

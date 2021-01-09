#!/bin/bash
sudo apt-get install jq
echo $(jq -h)
value="$REQUEST_URL"
export IFS=";"
count=1
curlAction() {
    result=$(curl --location --request GET $1)
    echo $result
    result=$(echo $result | jq '.code')
    if [ "$result" = "200" ]; then
        echo $result
    else
        if [ $count = 5 ]; then
            return 0
        else
            count=$(expr $count + 1)
            curlAction $1
        fi
    fi
    return 0
}
for url in $value; do
    echo $url
    count=1
    curlAction $url
done

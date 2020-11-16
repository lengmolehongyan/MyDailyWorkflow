result1=$(curl 'https://cccat.io/user/_checkin.php' \
    -H 'authority: cccat.io' \
    -H 'pragma: no-cache' \
    -H 'cache-control: no-cache' \
    -H 'accept: application/json, text/javascript, */*; q=0.01' \
    -H 'user-agent: Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.193 Mobile Safari/537.36' \
    -H 'x-requested-with: XMLHttpRequest' \
    -H 'sec-fetch-site: same-origin' \
    -H 'sec-fetch-mode: cors' \
    -H 'sec-fetch-dest: empty' \
    -H 'referer: https://cccat.io/user/index.php' \
    -H 'accept-language: zh-CN,zh;q=0.9,en;q=0.8' \
    -H "$COOKIE_826" \
    --compressed)
title1='CCCAT_826_自动签到任务触发了'
content1=$(
    cat <<EOF
**任务**: ${title1}

**结果**: 
${result1}
EOF
)
echo "$content1"
node ./send_dd_notify.js --title "$title1" --desc "$content1"
result2=$(curl 'https://cccat.io/user/_checkin.php' \
    -H 'authority: cccat.io' \
    -H 'pragma: no-cache' \
    -H 'cache-control: no-cache' \
    -H 'accept: application/json, text/javascript, */*; q=0.01' \
    -H 'user-agent: Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.193 Mobile Safari/537.36' \
    -H 'x-requested-with: XMLHttpRequest' \
    -H 'sec-fetch-site: same-origin' \
    -H 'sec-fetch-mode: cors' \
    -H 'sec-fetch-dest: empty' \
    -H 'referer: https://cccat.io/user/index.php' \
    -H 'accept-language: zh-CN,zh;q=0.9' \
    -H "$COOKIE_LENGMO" \
    --compressed)
title2='CCCAT_lengmo_自动签到任务触发了'
content2=$(
    cat <<EOF
**任务**: ${title2}

**结果**: 
${result2}
EOF
)
echo "$content2"
node ./send_dd_notify.js --title "$title2" --desc "$content2"

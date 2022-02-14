#!/bin/bash
# GET THE TOKEN:
TOKEN_VALUE=`curl -H 'Host: api.mathpix.com' -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:97.0) Gecko/20100101 Firefox/97.0' -H 'accept: application/json, text/plain, */*' -H 'accept-language: en-US,en;q=0.5' -H 'content-type: application/json;charset=utf-8' -H 'origin: https://accounts.mathpix.com' -H 'referer: https://accounts.mathpix.com/' -H 'sec-fetch-dest: empty' -H 'sec-fetch-mode: cors' -H 'sec-fetch-site: same-site' -H 'te: trailers' --data-binary '{"email":"mmarzou0@gmail.com","password":"Mavaratchi1,"}' --compressed 'https://api.mathpix.com/v1/user/login' | python -c "import sys, json; print json.load(sys.stdin).values()[1]"`;







# RENEW THE CREDIT:
subscription_id=16A0CASxNNJvdH17P; curl -H "Host: api.mathpix.com" -H "Cookie: mathpix_token=Bearer%20$TOKEN_VALUE" -H "user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:97.0) Gecko/20100101 Firefox/97.0" -H "accept: application/json, text/plain, */*" -H "accept-language: en-US,en;q=0.5" -H "content-type: application/json" -H "origin: https://accounts.mathpix.com" -H "referer: https://accounts.mathpix.com/" -H "sec-fetch-dest: empty" -H "sec-fetch-mode: cors" -H "sec-fetch-site: same-site" -H "te: trailers" --data-binary '{"plan_id":"free-plan","subscription_id":"16A0CASxNNJvdH17P"   , "excess_payments":10}' --compressed https://api.mathpix.com/api/generate_checkout_existing_url







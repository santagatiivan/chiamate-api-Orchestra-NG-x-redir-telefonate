#!/bin/bash
#

source credentials.sh

declare -r BROWSER_TZ="Europe/Rome";
declare -r REQUEST_DATE="$(date --utc +"%a, %d %b %Y %H:%M:%S %Z")";

declare TOKEN;

TOKEN=$(curl \
	--data "username=${USERNAME}" \
	--data "password=${PASSWORD}" \
	--data "request_date=${REQUEST_DATE}" \
	--data "browser_tz=${BROWSER_TZ}" \
	--data "api=true" \
	--insecure \
	--silent \
	"${BASE_URL}" |
jq \
	--raw-output \
	".token" \
);

if [ -z "${TOKEN}" ]; then
	echo "Wrong authentication" >&2;
	exit 1;
fi

#!/bin/bash
#
#

declare -r WORK_DIR="$(dirname $0)";

source ${WORK_DIR}/get-token.sh;

declare -r API_PATH="/jsondata/extjs/userHandler/read";

curl \
	--data-urlencode "token=${TOKEN}" \
	--data-urlencode "start=0" \
	--data-urlencode "page=1" \
	--data-urlencode "limit=25" \
	--insecure \
	--silent \
	"${BASE_URL}${API_PATH}" \
;
	#--header "Content-type: application/x-www-form-urlencoded; charset=UTF-8" \

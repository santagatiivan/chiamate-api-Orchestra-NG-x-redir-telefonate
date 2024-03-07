#!/bin/bash
#
#

declare -r WORK_DIR="$(dirname $0)";

if [ $# -lt 1 ]; then
	echo "Usage: $(basename $0) <matricola>" >&2;
	exit 1;
fi

declare -r -i MATRICOLA=$1;

source ${WORK_DIR}/get-token.sh;

declare -r API_PATH="/jsondata/extjs/userHandler/read";

curl \
	--data-urlencode "token=${TOKEN}" \
	--data-urlencode "start=0" \
	--data-urlencode "page=1" \
	--data-urlencode "limit=2000" \
	--insecure \
	--silent \
	"${BASE_URL}${API_PATH}" |
jq \
	".data.[] | select (.identification_number == ${MATRICOLA}) | .id" \
;

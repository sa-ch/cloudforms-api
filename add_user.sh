#!/bin/bash
# =====================================================================
#        File:  add_user.sh
#    Location:  https://github.com/sa-ch/cloudforms-api.git
#   Launguage:  sh
#    Category:  cloudforms-api
#     Purpose:  Demonstrates Red Hat CloudForms API Interface
#      Author:  Sacha Dubois, Red Hat
#
# Copyright (c) 2010 - 2012 Red Hat, Inc.
# This software is licensed to you under the GNU General Public License,
# version 2 (GPLv2). There is NO WARRANTY for this software, express or
# implied, including the implied warranties of MERCHANTABILITY or FITNESS
# FOR A PARTICULAR PURPOSE. You should have received a copy of GPLv2
# along with this software; if not, see
# http://www.gnu.org/licenses/old-licenses/gpl-2.0.txt.
#
# Red Hat trademarks are not licensed under GPLv2. No permission is
# granted to use or replicate Red Hat trademarks that are incorporated
# in this software or its documentation.
# =====================================================================
# 02.04.2017  Sacha Dubois  new
# =====================================================================

if [ "$RHCF_USER" == "" ]; then 
  echo "$0 No environment file hast been loaded RHCF_USER and RHCF_PASS are not set"
  exit
fi

if [ "$1" == "" ]; then 
  echo "usage: $0 <user-name>"
  exit
fi


. ./functions.sh

RHCF_TOKEN=$(get_token)

CFAPI="-k -s -S -H 'Accept: application/json' -H 'X-Auth-Token: ${RHCF_TOKEN}'"

RHCF_CREATE_USER_NAME='Test User' 
RHCF_CREATE_USER_ID="$1"
RHCF_CREATE_USER_GROUP_ID='1000000000002'
RHCF_CREATE_USER_PASSWORD='Password123'
RHCF_CREATE_USER_REQUEST=$(cat <<EOF
 {
    "action" : "create",
    "resource" : {
      "name" : "${RHCF_CREATE_USER_NAME}",
      "userid" : "${RHCF_CREATE_USER_ID}",
      "group" : { "href": "${RHCF_API}/groups/${RHCF_CREATE_USER_GROUP_ID}"},
      "password" : "${RHCF_CREATE_USER_PASSWORD}"
    }
  }
EOF
)

echo $RHCF_CREATE_USER_REQUEST > /tmp/1

echo "$RHCF_CREATE_USER_REQUEST" | eval curl $CFAPI -X POST ${RHCF_API}/users/ -d @- | python -m json.tool

exit

# LIST CLOUDFORMS API OBJECTS
for user in $(eval curl $CFAPI -X GET ${RHCF_API}/users | python -m json.tool | grep href | \
grep "/users/" | sed 's/"//g' | awk -F'/' '{ print $NF }'); do

  echo ""
  eval curl $CFAPI -X GET ${RHCF_API}/users/${user} | python -m json.tool | sed -n '/created_on/,/userid/p' | \
  sed -e 's/    "//g' -e 's/"//g' -e 's/,//g'
done







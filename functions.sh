#!/usr/bin/bash
# =====================================================================
#        File:  functions.sh
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

get_token() {
  curl -u "${RHCF_USER}:${RHCF_PASS}" -k -s -S -X GET "${RHCF_API}/auth" -H 'Content-Type: application/json' -H 'Accept: application/json' | python -m json.tool | grep auth_token | sed -e 's/"//g' -e 's/,//g' | awk '{ print $2 }'
}


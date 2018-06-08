#!/bin/bash
#
# Adds new domain to `openssl.conf`.
# 
# Copyright: Copyright (C) 2018 Justin Hartman <justin@hartman.me> (https://justin.hartman.me)
# Author   : Justin Hartman <justin@hartman.me> (https://justin.hartman.me)
# License  : https://opensource.org/licenses/AGPL-3.0 AGPL-3.0
# Version  : 0.4.1
# Link     : https://github.com/22digital/Automated-LAMP-trusted-localhost-SSL
# Link     : https://justin.hartman.me
# Since    : 0.4.0
# 
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU Affero General Public License as
# published by the Free Software Foundation, either version 3 of the
# License, or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU Affero General Public License for more details.
#
# You should have received a copy of the GNU Affero General Public License
# along with this program. If not, see <https://www.gnu.org/licenses/>.
#

#######################################
# Adds new domain to `openssl.conf`
# Globals:
#   None
# Arguments:
#   None
# Returns:
#   String Printf string to add domain.
#######################################
openssl_config ()
{
    echo "" >&2
    echo -e "${ORG} ----------------------------------------------" >&2
    echo "|                                              |" >&2
    echo "|  Add domain to 'openssl.conf' configuration  |" >&2
    echo "|  file.                                       |" >&2
    echo "|                                              |" >&2
    echo -e " ---------------------------------------------- ${NOC}\n" >&2
    read serial <<< $(wc -l < '$ssl/openssl.conf' | tr -d ' ')
    serial=$((serial-11))
    echo "DNS.${serial}      =   ${domain}" >> $ssl/openssl.conf
    cat $ssl/openssl.conf | grep "DNS"
    printf "\n${GRN}\xE2\x9C\x94${NOC} ${CYA}Successfully added the ${domain}
  domain name to the openssl configuration file.${NOC}\n"
}

openssl_config
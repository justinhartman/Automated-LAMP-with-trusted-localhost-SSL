#!/bin/bash
#
# Fully automated LAMP installation and configuration using Trusted localhost 
# SSL Certificates
# 
# Copyright: Copyright (C) 2018 Justin Hartman (https://justin.hartman.me)
# Author   : Justin Hartman <justin@hartman.me> (https://justin.hartman.me)
# License  : https://opensource.org/licenses/AGPL-3.0 AGPL-3.0
# Version  : 1.0.1
# Link     : https://github.com/22digital/Automated-LAMP-trusted-localhost-SSL
# Link     : https://justin.hartman.me
# Since    : 0.2.0
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
# Backs up the original `/etc/hosts`
# file to the `hosts/` directory.
# Globals:
#   None
# Arguments:
#   None
# Returns:
#   String Success message.
#######################################
hosts_file_backup ()
{
    echo "" >&2
    echo -e "${BRO} ----------------------------------------------" >&2
    echo "|                                              |" >&2
    echo "|  Backup original hosts file ${hosts}       |" >&2
    echo "|                                              |" >&2
    echo -e " ---------------------------------------------- ${NOC}\\n" >&2
    cp "${hosts}" "${dist}"/hosts/hosts.original
    echo -e "${GRN}\\xE2\\x9C\\x94${NOC} ${CYA}Successfully backed up hosts file.${NOC}\\n" >&2
}

#######################################
# Creates a symbolic link from 
# `/etc/hosts` to `dist/hosts/hosts`.
# Globals:
#   None
# Arguments:
#   None
# Returns:
#   String Success message.
#######################################
hosts_symbolic ()
{
    echo "" >&2
    echo -e "${GRY} ----------------------------------------------" >&2
    echo "|                                              |" >&2
    echo "|  Create symbolic link for ${hosts} to      |" >&2
    echo "|  point to 'dist/hosts/hosts' file.           |" >&2
    echo "|                                              |" >&2
    echo -e " ---------------------------------------------- ${NOC}\\n" >&2
    ln -s "${hosts}" "${dist}"/hosts/hosts
    ls -lh "${dist}"/hosts/hosts
    echo -e "\\n${GRN}\\xE2\\x9C\\x94${NOC} ${CYA}Successfully created symbolic link from ${hosts} to ${dist}/hosts/hosts.${NOC}\\n" >&2
}

#######################################
# Run all the methods for the hosts.
#######################################
hosts_file_backup
hosts_symbolic

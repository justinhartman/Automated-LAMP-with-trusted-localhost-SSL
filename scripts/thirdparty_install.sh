#!/bin/bash
#
# Fetches all third-party sub-modules and installs them in place.
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
# Installs all the required git
# submodules using the 'git submodule
# update' command.
# Globals:
#   None
# Arguments:
#   None
# Returns:
#   String
#######################################
git_submodule_install ()
{
    echo "" >&2
    echo -e "${ORG} ----------------------------------------------" >&2
    echo "|                                              |" >&2
    echo "|  Installing the Git Submodules...            |" >&2
    echo "|                                              |" >&2
    echo -e " ---------------------------------------------- ${NOC}\\n" >&2
    git submodule update --init --recursive
    echo -e "\\n${GRN}\\xE2\\x9C\\x94${NOC} ${CYA}Successfully installed the git submodules.${NOC}\\n"
}

#######################################
# Installs the Adminer project by
# copying the submodule code to
# `/usr/local/var/www/adminer/`.
# Globals:
#   None
# Arguments:
#   None
# Returns:
#   String
#######################################
adminer_copy ()
{
    echo "" >&2
    echo -e "${ORG} ----------------------------------------------" >&2
    echo "|                                              |" >&2
    echo "|  Installing the Adminer project...           |" >&2
    echo "|                                              |" >&2
    echo -e " ---------------------------------------------- ${NOC}\\n" >&2
    cp -R "${source}"/adminer "${main}"/adminer
    ln -s "${main}"/adminer "${dist}"/adminer
    echo -e "\\n${GRN}\\xE2\\x9C\\x94${NOC} ${CYA}Successfully copied the Adminer sub-module to ${main}/adminer and created a symbolic link to ${dist}/adminer in the project folder.${NOC}\\n"
}

#######################################
# Installs the Error Pages project by
# copying the submodule code to
# `/usr/local/var/www/error-pages/`.
# Globals:
#   None
# Arguments:
#   None
# Returns:
#   String
#######################################
errorpages_copy ()
{
    echo "" >&2
    echo -e "${GRN} ----------------------------------------------" >&2
    echo "|                                              |" >&2
    echo "|  Installing the Apache Error Pages project...|" >&2
    echo "|                                              |" >&2
    echo -e " ---------------------------------------------- ${NOC}\\n" >&2
    cp -R "${source}"/httpd/error-pages/dist/apache "${main}"/error-pages
    ln -s "${main}"/error-pages "${dist}"/error-pages
    echo -e "\\n${GRN}\\xE2\\x9C\\x94${NOC} ${CYA}Successfully copied the Apache Error Pages sub-module to ${main}/error-pages and created a symbolic link to ${dist}/error-pages in the project folder.${NOC}\\n"
}

#######################################
# Installs the phpMyAdmin project by
# downloading and untaring the code to
# `/usr/local/var/www/phpmyadmin/`.
# Globals:
#   None
# Arguments:
#   None
# Returns:
#   String
#######################################
phpmyadmin_install ()
{
    echo "" >&2
    echo -e "${BRO} ----------------------------------------------" >&2
    echo "|                                              |" >&2
    echo "|  Installing the phpMyAdmin project...        |" >&2
    echo "|                                              |" >&2
    echo -e " ---------------------------------------------- ${NOC}\\n" >&2
    mkdir -p "${source}"/phpmyadmin
    mkdir -p "${source}"/archives
    cd "${source}"/archives/ || return
    wget https://files.phpmyadmin.net/phpMyAdmin/4.8.1/phpMyAdmin-4.8.1-all-languages.tar.gz
    tar -zxvf phpMyAdmin-4.8.1-all-languages.tar.gz \
    -C ../../src/phpmyadmin \
    --strip-components=1
    cd ../../ || return
    cp -R "${source}"/phpmyadmin "${main}"/phpmyadmin
    ln -s "${main}"/phpmyadmin "${dist}"/phpmyadmin
    echo -e "\\n${GRN}\\xE2\\x9C\\x94${NOC} ${CYA}Successfully installed the phpMyAdmin sub-module to ${main}/phpmyadmin and created a symbolic link to ${dist}/phpmyadmin in the project folder.${NOC}\\n"
}

#######################################
# Install all the sub-modules required
# for the project.
#######################################
git_submodule_install
adminer_copy
errorpages_copy
phpmyadmin_install

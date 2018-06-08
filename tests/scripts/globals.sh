#!/bin/bash
#
# Global variables for the app to use. These are included on all main scripts.
# 
# Copyright: Copyright (C) 2018 Justin Hartman (https://justin.hartman.me)
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
# Sets up global user variables.
# Globals:
#   None
# Arguments:
#   None
# Returns:
#   Variables
#######################################
user_vars ()
{
    username="501"
    group="staff"
}

#######################################
# Sets up global variables to use when
# configuring SSL.
# Globals:
#   None
# Arguments:
#   None
# Returns:
#   Variables
#######################################
ssl_vars ()
{
    country="ZA"
    state="Western Cape"
    city="Cape Town"
    company="22 Digital"
    unit="Security"
}

#######################################
# Sets up global path variables to use.
# Globals:
#   None
# Arguments:
#   None
# Returns:
#   Variables
#######################################
path_vars ()
{
    main="/usr/local/var/www"
    httpd="/usr/local/etc/httpd"
    websites="/usr/local/var/www/websites"
    ssl="/usr/local/var/www/ssl"
    scripts="../scripts"
    source="../src"
    dist="./dist"
}

# Output the methods
user_vars
ssl_vars
path_vars
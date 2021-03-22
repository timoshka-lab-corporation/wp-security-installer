#!/usr/bin/env bash
set -e

INSTALL_PATH=$(pwd -P)
WORKING_PATH="${INSTALL_PATH}/wp-security"
GIT_BIN=$(which git)
COMPOSER_BIN=$(which composer)

read -p "Fill the Username:" username
read -p "Fill the Token:" -s token

$GIT_BIN clone "https://${token}:x-oauth-basic@github.com/timoshka-lab-corporation/wp-security.git"
$COMPOSER_BIN install -d "${WORKING_PATH}/src"
chmod u+x "${WORKING_PATH}/autoupdate.sh"
chmod u+x "${WORKING_PATH}/configure.sh"

cd "$WORKING_PATH"
$GIT_BIN config credential.helper store
$GIT_BIN config --global user.name "$username"
$GIT_BIN config --global user.password "$token"

echo "Installation successfully finished!"
exit 0
#!/bin/bash
set -e

INSTALL_PATH=$(cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P)
GIT_BIN=$(which git)
COMPOSER_BIN=$(which composer)

$GIT_BIN clone "https://github.com/timoshka-lab/wp-security.git"
$COMPOSER_BIN install -d "${INSTALL_PATH}/wp-security/src"
chmod u+x "${INSTALL_PATH}/wp-security/src/autoupdate.sh"

echo "Installation successfully finished!"
exit 0
#!/usr/bin/env bash

set -e

ORIGINAL_DIR="$(pwd)"
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $SCRIPT_DIR

function check_exec {
    type $1 >/dev/null 2>&1 || { echo >&2 "$1 required, but it's not installed.  Aborting."; exit 1; }
}

check_exec git
check_exec curl

curl -LO https://omnitruck.chef.io/install.sh && sudo bash ./install.sh -v 2.0.28 -P chefdk && rm install.sh

cd /tmp
git clone https://github.com/aboutte/role-base.git
cd role-base

# berks install

chef-client -z -o role-base
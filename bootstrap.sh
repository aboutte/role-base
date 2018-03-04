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
check_exec mktemp

cd $(mktemp -d)

curl -LO https://omnitruck.chef.io/install.sh
bash ./install.sh -v 2.0.28 -P chefdk
rm install.sh

rm -rf /etc/chef
mkdir -p /etc/chef/cookbooks/ /etc/chef/environments
cat <<EOF > /etc/chef/client.rb
log_level       :info
log_location    "/var/log/chef-client.log"
node_name       "$HOSTNAME"
chef_repo_path  "/etc/chef/"
cookbook_path   "/etc/chef/cookbooks/"
#data_bag_path   "/etc/chef/cookbooks/users-rean/databags/"
environment     "development"
local_mode      true
#json_attribs    "/etc/chef/json_attributes.json"
EOF


cat <<EOF > /etc/chef/environments/development.json
{
  "name": "development",
  "description": "This is the development environment file",
  "cookbook_versions": {

  },
  "json_class": "Chef::Environment",
  "chef_type": "environment",
  "default_attributes": {

  },
  "override_attributes": {

  }
}
EOF

git clone https://github.com/aboutte/role-base.git
mv role-base /etc/chef/cookbooks/

# berks install

chef-client --local-mode --override-runlist role-base --config /etc/chef/client.rb

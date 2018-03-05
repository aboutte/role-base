#!/usr/bin/env bash

set -e

if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit 1
fi

ORIGINAL_DIR="$(pwd)"
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $SCRIPT_DIR

PKG_MGMT="yum"
command -v yum >/dev/null 2>&1 || { PKG_MGMT="apt-get"; }

$PKG_MGMT install -y git curl mktemp

cd $(mktemp -d)

curl -LO https://omnitruck.chef.io/install.sh
bash ./install.sh -v 2.0.28 -P chefdk
rm -rf install.sh

rm -rf /etc/chef
mkdir -p /etc/chef/cookbooks/ /etc/chef/environments

cat <<EOF > /etc/chef/client.rb
log_level       :info
log_location    "/var/log/chef-client.log"
node_name       "$HOSTNAME"
chef_repo_path  "/etc/chef/"
cookbook_path   "/etc/chef/cookbooks/"
environment     "development"
local_mode      true
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
cd /etc/chef/cookbooks/role-base
berks vendor /etc/chef/cookbooks/

chef-client --override-runlist role-base --config /etc/chef/client.rb

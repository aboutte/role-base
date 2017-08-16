#
# Cookbook:: role-bsae
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.


node['role-base']['packages'].each do |package|
  package package do
    retries 3
    retry_delay 10
    action :install
  end
end

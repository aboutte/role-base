#
# Cookbook:: role-base
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

recipes = []
cb = run_context.cookbook_collection['role-base']
cb.manifest['all_files'].each do |file|
  if file['name'].include?('recipe')
    recipes << file['name'].gsub('recipes/', '').gsub('.rb', '')
  end
end

# add include for OS specific, OS family, etc, only if recipe exists
os_family = node['platform_family']                 # rhel, debian
os = node['platform']                               # redhat, centos, ubuntu
os_version = node['platform_version'].split('.')[0] # 7, 6, 14, 16

# include the OS family
Chef::Log.warn("Looking for recipe 'role-base::family_#{os_family}'")
if recipes.include?("family_#{os_family}")
  Chef::Log.warn("Found and including recipe 'role-base::family_#{os_family}'")
  include_recipe 'role-base::family_' + os_family
end

# include generic OS
Chef::Log.warn("Looking for recipe 'role-base::os_#{os}'")
if recipes.include?("os_#{os}")
  Chef::Log.warn("Found and including recipe 'role-base::os_#{os}'")
  include_recipe 'role-base::os_' + os
end

# include specific OS version
Chef::Log.warn("Looking for recipe 'role-base::os_#{os + os_version}'")
if recipes.include?("os_#{os + os_version}")
  Chef::Log.warn("Found and including recipe 'role-base::os_#{os + os_version}'")
  include_recipe 'role-base::os_' + os + os_version
end

include_recipe 'role-base::packages'
include_recipe 'role-base::aliases'

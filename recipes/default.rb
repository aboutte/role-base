#
# Cookbook:: role-base
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

recipes = []
cb = run_context.cookbook_collection['role-base']
cb.manifest['all_files'].each do |file|
  if file['name'].include?('recipe')
    recipes << file['name'].gsub('recipes/','').gsub('.rb','')
  end
end

# add include for OS specific, OS family, etc, only if recipe exists
os_family = node['platform']                        # redhat,
os = node['platform_family']                        # rhel,
os_version = node['platform_version'].split('.')[0] # 7, 6

# include the OS family
if recipes.include?(os_family)
  include_recipe 'role-base::' + os_family
end

# include generic OS
if recipes.include?(os)
  include_recipe 'role-base::' + os
end

# include specific OS version
if recipes.include?(os + os_version)
  include_recipe 'role-base::' + os + os_version
end

include_recipe 'role-base::packages'
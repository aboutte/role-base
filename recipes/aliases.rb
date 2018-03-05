#
# Cookbook:: role-base
# Recipe:: aliases
#
# Copyright:: 2018, The Authors, All Rights Reserved.

magic_shell_alias 'll' do
  command 'ls -l --color=auto'
end

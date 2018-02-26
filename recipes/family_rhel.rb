
include_recipe 'yum-epel'

execute 'yum update' do
  command 'yum update -y'
end
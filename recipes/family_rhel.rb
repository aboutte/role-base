
include_recipe 'yum-epel'

execute 'yum update' do
  command 'yum update -y'
end

execute 'yum upgrade' do
  command 'yum upgrade -y'
end

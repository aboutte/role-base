
node['role-base']['packages'].each do |package|
  package package do
    retries 3
    retry_delay 10
    action :install
  end
end
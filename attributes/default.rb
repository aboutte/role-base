
default['role-base']['packages'] = %w(curl wget vim git sysstat strace iptraf net-tools unzip)

# lynx htop jq

case node['platform']
when 'centos'
  default['role-base']['packages'].push('bind-utils', 'nmap-ncat')
when 'debian'
end

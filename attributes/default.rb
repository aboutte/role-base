
default['role-base']['packages'] = %w(curl wget vim git lynx htop sysstat strace iptraf net-tools, jq, unzip)

case node['platform']
when 'centos'
  default['role-base']['packages'].push('bind-utils', 'nmap-ncat')
when 'debian'
end

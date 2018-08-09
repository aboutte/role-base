
os_family = node['platform_family']                 # rhel, debian
os = node['platform']                               # redhat, centos, ubuntu
os_version = node['platform_version'].split('.')[0] # 7, 6, 14, 16

default['role-base']['packages'] = %w(curl wget vim git jq htop strace iptraf net-tools unzip zip tcpdump wireshark traceroute)

case os_family
when 'debian'
  node.default['role-base']['packages'].push('lynx', 'sysstat', 'tshark', 'dnsutils', 'awscli', 'groff')
when 'rhel'
    node.default['role-base']['packages'].push('bind-utils')
when 'amazon'
end

case os
when 'redhat'
when 'centos'
when 'ubuntu'
end

case os + os_version
when 'redhat6'
  node.default['role-base']['packages'].push('nc', 'lynx', 'sysstat')
when 'redhat7'
  node.default['role-base']['packages'].push('nmap-ncat', 'sysstat', 'python34')
when 'centos6'
  node.default['role-base']['packages'].push('nc', 'lynx', 'sysstat')
when 'centos7'
  node.default['role-base']['packages'].push('nmap-ncat', 'lynx', 'sysstat')
when 'ubuntu16'
  node.default['role-base']['packages'].push('netcat', 'python')
end

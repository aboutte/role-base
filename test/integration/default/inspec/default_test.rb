# encoding: utf-8

commands = ['dig', 'nc', 'tcpdump', 'tshark', 'strace', 'curl', 'wget', 'vim', 'git', 'jq', 'htop', 'strace', 'unzip', 'zip', 'traceroute', 'python']

# aws

commands.each do |cmd|
  describe bash("command -v #{cmd}") do
    its('exit_status') { should eq 0 }
  end
end

if os[:family] == 'redhat'
  describe file('/etc/yum.repos.d/epel.repo') do
    it { should exist }
  end
end

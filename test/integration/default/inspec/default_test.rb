# # encoding: utf-8

commands = ['dig', 'nc', 'tcpdump', 'tshark', 'strace', 'curl', 'wget', 'vim', 'git', 'jq', 'htop', 'strace', 'unzip', 'zip']



if os[:family] == 'redhat'

  commands.each do |cmd|
    describe bash("command -v #{cmd}") do
      its('exit_status') { should eq 0 }
    end
  end

  describe file('/etc/yum.repos.d/epel.repo') do
    it { should exist }
  end
end

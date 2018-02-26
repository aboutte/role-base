# # encoding: utf-8

if os[:family] == 'redhat'
  describe file('/etc/yum.repos.d/epel.repo') do
    it { should exist }
  end
end

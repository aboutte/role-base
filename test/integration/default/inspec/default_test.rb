# # encoding: utf-8



%w(curl wget vim git sysstat strace net-tools unzip).each do |pkg|
  describe package(pkg) do
    it { should be_installed }
  end
end


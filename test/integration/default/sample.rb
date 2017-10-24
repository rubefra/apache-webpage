describe package 'httpd' do
  it { should be_installed }
end

describe service 'httpd' do
  it { should be_running }
  it { should be_enabled }
end

describe port 80 do
  it { should be_listening }
end

# hack to get local IP see https://github.com/chef/inspec/issues/722
# ip = command("ip addr | grep 'state UP' -A2 | tail -n1 | awk '{print $2}' | cut -f1  -d'/'").stdout.strip

describe http("http://localhost:18080") do
  its('status') { should cmp 200 }
  its('body') { should match /Let there be rock/ }
end

package 'httpd' do
    action :install
end

file '/etc/motd' do
    owner 'root'
    group 'root'
    mode '0644'
    content 'Hello world'
end

service 'httpd' do

action [:enable, :start]

end

user 'ifeanyi.onyia' do

comment 'Cloud Engineer'
home '/home/ifeanyi'

shell '/bin/bash'

end

file '/test.sh' do
content '#!/bin/bash 
ls-ltra /home | tee /account.txt'
mode '0755'
owner 'root'
group 'root'

end

cron 'test' do
  hour '5'
  minute '45'
  command '/test.sh'
end


timezone "Set the host's timezone to Europe/London" do
  timezone 'Europe/London'
end
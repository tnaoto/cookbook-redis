#
# Cookbook Name:: redis
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

remote_file "/usr/local/src/redis-2.6.9.tar.gz" do
        source "http://redis.googlecode.com/files/redis-2.6.9.tar.gz"
        notifies :run, "bash[install_program]", :immediately
end

bash "install_program" do
        not_if "ls /usr/local/bin/redis-server"
        user "root"
        cwd "/usr/local/src"
        code <<-EOH
                tar -zxf redis-2.6.9.tar.gz
                (cd redis-2.6.9/ && make test && make && make install)
        EOH
end
#
# Cookbook Name:: ruby
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

bash "yum install" do
	code <<-EOH
	yum install -y curl curl-devel gcc gcc-c++ git openssl-devel httpd-devel readline-devel tk-devel make zlib-devel libffi-devel
	yum --enablerepo=epel -y install libyaml-devel
	EOH
end

remote_file "/tmp/ruby-1.9.3-p392.tar.gz" do
	source "http://ftp.iij.ad.jp/pub/lang/ruby/1.9/ruby-1.9.3-p392.tar.gz"
#	notifies :run,"bash[install_ruby]", :immediately
end

script "install_ruby" do
	interpreter "bash"
	user	"root"
	cwd "/tmp"
	code <<-EOH
	tar zxvf ruby-1.9.3-p392.tar.gz
	cd ruby-1.9.3-p392
	./configure
	make
	make install
	EOH
end
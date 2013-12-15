#
# Cookbook Name:: myapp
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
%w{apache2 mysql-server}.each do |each|
  package "#{each}" do
    action :install
  end
end

=begin
service "apache" do
  action[ :enable, :start]
  supports :status => true, :restart => true, :reload => true
end

service "mysql" do
  action[ :enable, :start]
  supports :status => true, :restart => true, :reload => true
end
=end
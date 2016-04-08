#
# Cookbook Name:: jenkins
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

# wget -q -O - https://jenkins-ci.org/debian/jenkins-ci.org.key
remote_file '/tmp/jenkins-ci.org.key' do
  source 'https://jenkins-ci.org/debian/jenkins-ci.org.key'
  notifies :run, 'execute[apt-key add /tmp/jenkins-ci.org.key]', :immediately
end

# sudo apt-key add -
execute 'apt-key add /tmp/jenkins-ci.org.key' do
  action :nothing
end

# sudo sh -c 'echo deb http://pkg.jenkins-ci.org/debian binary/ > /etc/apt/sources.list.d/jenkins.list'
file '/etc/apt/sources.list.d/jenkins.list' do
  content 'deb http://pkg.jenkins-ci.org/debian binary/'
  notifies :run, 'execute[apt-get update]', :immediately
end

# sudo apt-get update
execute 'apt-get update' do
  action :nothing
end

# Found this issue with the installation:
# https://issues.jenkins-ci.org/browse/JENKINS-31814
package 'openjdk-7-jre-headless'

# sudo apt-get install jenkins
package 'jenkins'

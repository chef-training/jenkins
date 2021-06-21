#
# Cookbook:: jenkins
# Recipe:: default
#
# Copyright:: (c) 2016 The Authors, All Rights Reserved.

include_recipe 'apt::default'

apt_repository 'jenkins' do
  uri 'http://pkg.jenkins-ci.org/debian'
  distribution 'binary/'
  key 'https://jenkins-ci.org/debian/jenkins-ci.org.key'
end

# Found this issue with the installation:
# https://issues.jenkins-ci.org/browse/JENKINS-31814
package 'openjdk-7-jre-headless'

# sudo apt-get install jenkins
package 'jenkins'

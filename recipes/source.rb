#
# Cookbook Name: ruby
# Recipe: source
#
# Copyright 2010-2013, Brad Seefeld
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Install all build dependencies
packages = %w{build-essential libc6-dev libpq-dev libreadline6 libreadline6-dev zlib1g zlib1g-dev libssl-dev libxml2-dev libxslt-dev libyaml-dev}
packages.each do |p|
  package p do
    action :install
  end
end

remote_file "/tmp/yaml-#{node.ruby.yaml.version}.tar.gz" do
  source node.ruby.yaml.url
  action :create_if_missing
end

bash "install yaml" do
  cwd "/tmp"
  code <<-EOH
    tar xzvf yaml-#{node.ruby.yaml.version}.tar.gz
    cd /tmp/yaml-#{node.ruby.yaml.version}
    ./configure --prefix=#{node.ruby.yaml.install_path}
    make && make install
  EOH
  not_if { ::File.exists?("/tmp/yaml-#{node.ruby.yaml.version}") }
end

remote_file "/tmp/ruby-#{node.ruby.version}.tar.gz" do
  source node.ruby.source.url
  action :create_if_missing
end

bash "install ruby" do
  cwd "/tmp"
  code <<-EOH
    tar -xvf ruby-#{node.ruby.version}.tar.gz
    cd ruby-#{node.ruby.version}
    ./configure --with-opt-dir=#{node.ruby.source.install_path} --disable-install-doc
    make && make install
    gem update --system #{node.ruby.rubygems.version}
  EOH
  not_if { ::File.directory?("#{node.ruby.source.install_path}/ruby") }
end

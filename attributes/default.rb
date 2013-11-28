default[:ruby][:install] = "source"
default[:ruby][:version] = "2.0.0-p247"
default[:ruby][:source][:install_path] = "/usr/local/lib"
default[:ruby][:source][:url] = "http://ftp.ruby-lang.org/pub/ruby/2.0/ruby-#{node.ruby.version}.tar.gz"
default[:ruby][:rubygems][:version] = "2.1.7"

default[:ruby][:yaml][:version] = "0.1.4"
default[:ruby][:yaml][:url] = "http://pyyaml.org/download/libyaml/yaml-#{node.ruby.yaml.version}.tar.gz"
default[:ruby][:yaml][:install_path] = "/usr/local"
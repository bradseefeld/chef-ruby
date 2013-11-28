name             "ruby"
maintainer       "Brad Seefeld"
maintainer_email "bradley.seefeld@gmail.com"
license          "Apache 2.0"
description      "Installs ruby and rubygems"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "1.0.2"
%w{ debian ubuntu centos redhat fedora }.each do |os|
  supports os
end

recipe "ruby::default", "Installs and configures Ruby"

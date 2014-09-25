package node.ruby.package.name do
  version node.ruby.package.version
  action :install
  options "--force-yes"
end

bash "update rubygems" do
  code "gem update --system #{node.ruby.rubygems.version}"
end

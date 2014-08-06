package node.ruby.package.name do
  version node.ruby.package.version
end

bash "update rubygems" do
  code "gem update --system #{node.ruby.rubygems.version}"
end
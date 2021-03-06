#
# Cookbook Name:: postgresql
# Recipe:: debian_backports
#

# backports for initial support
backports_uri = if node["lsb"]["codename"] == "squeeze"
                  "http://backports.debian.org/debian-backports"
                else
                  # starting with 7.0/wheezy:
                  "http://httpredir.debian.org/debian"
                end

apt_repository "debian-backports" do
  uri backports_uri
  distribution "#{node["lsb"]["codename"]}-backports"
  components ["main"]
end

# backports support for debian
%w[libpq5 postgresql-common].each do |pkg|
  package pkg do
    options "-t #{node["lsb"]["codename"]}-backports"
  end
end

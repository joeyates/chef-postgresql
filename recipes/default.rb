#
# Cookbook Name:: postgresql
# Recipe:: default
#

# pin default package preferences
apt_preference "pgdg" do
  glob "*"
  pin "release o=apt.postgresql.org"
  pin_priority "750"
end

include_recipe "postgresql::apt_repository"
package "postgresql-common"  # install common files

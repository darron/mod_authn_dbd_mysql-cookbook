# encoding: utf-8
#
# Cookbook Name:: mod_authn_dbd_mysql
# Recipe:: default
#
# Copyright (C) 2014, Darron Froese <darron@froese.org>
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

include_recipe 'chef-sugar::default'

include_recipe 'php5_apache2::default'

template '/etc/apache2/conf-available/dbd_mysql.conf' do
  source 'dbd_mysql.conf.erb'
  owner 'root'
  group 'root'
  mode '0640'
  only_if { File.exist?('/etc/apache2/conf-available/') }
end

# Load the required modules.
node['apache']['additional_modules'].each do |mod|
  execute "/usr/sbin/a2enmod #{mod}" do
    command "/usr/sbin/a2enmod #{mod}"
    not_if { File.symlink?("/etc/apache2/mods-enabled/#{mod}.load") }
    notifies :restart, 'service[apache2]'
  end
end

# Load the required config.
node['apache']['additional_config'].each do |mod|
  execute "/usr/sbin/a2enconf #{mod}" do
    command "/usr/sbin/a2enconf #{mod}"
    not_if { File.symlink?("/etc/apache2/conf-enabled/#{mod}.conf") }
    notifies :reload, 'service[apache2]'
  end
end

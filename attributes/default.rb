# encoding: utf-8
#
# Cookbook Name:: mod_authn_dbd_mysql
# Attributes:: default
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

default['mysql']['host'] = '127.0.0.1'
default['mysql']['port'] = '3306'
default['mysql']['username'] = 'username_here'
default['mysql']['pass'] = 'password_here'

default['dbdmin'] = '2'
default['dbdkeep'] = '4'
default['dbdmax'] = '10'
default['dbdexptime'] = '300'

default['apache']['additional_modules'] = %w[ dbd authn_dbd ]
default['apache']['additional_config'] = %w[ dbd_mysql ]

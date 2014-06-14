# encoding: utf-8
name             'mod_authn_dbd_mysql'
maintainer       'Darron Froese'
maintainer_email 'darron@froese.org'
license          'Apache 2.0'
description      'Installs/configures mod_authn_dbd_mysql'
version          '0.3.0'
recipe           'mod_authn_dbd_mysql::default', 'Installs/configures mod_authn_dbd_mysql'

depends 'chef-sugar'
depends 'php5_apache2'
depends 'apache2'

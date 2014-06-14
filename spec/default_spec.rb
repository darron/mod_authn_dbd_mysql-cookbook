# encoding: utf-8
require 'spec_helper'

# Write unit tests with ChefSpec - https://github.com/sethvargo/chefspec#readme
describe 'mod_authn_dbd_mysql::default' do
  let(:chef_run) { ChefSpec::Runner.new.converge(described_recipe) }

  it 'installs apache2 and php5' do
    expect(chef_run).to include_recipe('php5_apache2::default')
  end
end

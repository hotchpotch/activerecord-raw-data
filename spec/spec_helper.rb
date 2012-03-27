require 'bundler'
Bundler.setup(:default, :development)

require 'database'
require 'activerecord-raw-data'

RSpec.configure do |config|
  config.mock_with :rspec

  config.before(:suite) do
    User::Migration.up
    DatabaseCleaner.clean_with :deletion
    DatabaseCleaner.strategy = :deletion
  end

  config.before(:each) do
    DatabaseCleaner.clean
  end
end


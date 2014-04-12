require "rubygems"
require "bundler/setup"
require "destroy_associates"

RSpec.configure do |config|
  config.mock_framework = :rspec
  config.before :all do
    Dir.mkdir("tmp") unless Dir.exists?("tmp")
    ActiveRecord::Base.establish_connection(adapter: "sqlite3", database: "tmp/rspec.sqlite")
  end
end

def create_temp_table(name, &block)
  before :all do
    migration = ActiveRecord::Migration.new
    migration.verbose = false
    migration.create_table name, &block
  end

  after :all do
    migration = ActiveRecord::Migration.new
    migration.verbose = false
    migration.drop_table name
  end
end

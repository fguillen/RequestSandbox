ENV['RACK_ENV'] = 'test'

require "rack/test"
require "minitest/unit"
require "minitest/autorun"
require "mocha/setup"
require "database_cleaner"

require_relative "../app/request_sandbox"

class MiniTest::Unit::TestCase
  FIXTURES = File.expand_path("#{File.dirname(__FILE__)}/fixtures")
  DatabaseCleaner.strategy = :truncation
end


require_relative "test_helper"

class RequestTest < MiniTest::Unit::TestCase
  def setup
    DatabaseCleaner.start
  end

  def teardown
    DatabaseCleaner.clean
  end

  def test_should_be_valid
    assert Request.create!(:key => "THE_KEY", :info => {:key => "value"}).valid?
  end
end
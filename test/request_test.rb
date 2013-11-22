require_relative "test_helper"

class RequestTest < MiniTest::Unit::TestCase
  def test_should_be_valid
    assert Request.create!(:key => "THE_KEY").valid?
  end
end
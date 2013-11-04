require_relative "test_helper"

class ConfigTest < MiniTest::Unit::TestCase
  def test_value
    assert_equal("Sinatra Skeleton", SinatraSkeleton::CONFIG["message"])
  end
end
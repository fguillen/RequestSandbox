require_relative "test_helper"

class AppConfigTest < MiniTest::Unit::TestCase
  def test_value
    assert_equal("Request Sandbox (test)", RequestSandbox::APP_CONFIG["message"])
  end
end
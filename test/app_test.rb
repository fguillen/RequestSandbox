require_relative "test_helper"

class RequestSandbox::AppTest < MiniTest::Unit::TestCase
  include Rack::Test::Methods

  def app
    RequestSandbox::App
  end

  def test_root
    get "/"
    assert last_response.ok?
    assert_match "Sinatra Skeleton!", last_response.body
  end

  def test_other_page
    get "/other_page"
    assert last_response.ok?
    assert_match "This is the other page!", last_response.body
  end
end
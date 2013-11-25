require_relative "test_helper"

class RequestSandbox::AppTest < MiniTest::Unit::TestCase
  include Rack::Test::Methods

  def setup
    DatabaseCleaner.start
  end

  def teardown
    DatabaseCleaner.clean
  end

  def app
    RequestSandbox::App
  end

  def test_root
    get "/"
    assert last_response.ok?
  end

  def test_ping
    get "/ping/AA"

    assert last_response.ok?
    assert_equal("application/json;charset=utf-8", last_response.content_type)
    assert_equal("ok", JSON.parse(last_response.body)["status"])

    request = Request.last
    assert_equal("AA", request.key)
  end

  def test_ping_with_complex_url
    get "/ping/AA/BB/CC?p1=v1"

    assert last_response.ok?

    request = Request.last
    assert_equal("AA/BB/CC", request.key)
  end

  def test_show
    request_1 = Request.create!(:key => "THE_KEY", :info => {:key => "value"})
    request_2 = Request.create!(:key => "THE_KEY", :info => {:key => "value"})
    request_3 = Request.create!(:key => "OTHER_KEY", :info => {:key => "value"})

    get "/show/THE_KEY"

    assert_match "THE_KEY", last_response.body
    refute_match "OTHER_KEY", last_response.body
  end
end
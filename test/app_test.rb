require 'test_helper'
require 'rack/test'

class AppTest < Test::Unit::TestCase
  include Rack::Test::Methods

  def app
    Plextrics.app
  end

  def test_it_says_ok
    get '/'
    assert last_response.ok?
    assert_equal 'ok', last_response.body
  end
end

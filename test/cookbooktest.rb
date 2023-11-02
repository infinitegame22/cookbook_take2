require_relative "../main"
require "minitest/autorun"
#require "rack/test"
ENV['RACK_ENV'] = 'test'

class CookbookTest < Minitest::Test
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  def test_for_echo
    get '/'
    assert last_response.ok?
    assert_equal 'Echo', last_response.body
  end
end
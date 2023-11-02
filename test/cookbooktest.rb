require "minitest/autorun"
require "rack/test"
require_relative "../main"

ENV['RACK_ENV'] = 'test'

class CookbookTest < Minitest::Test
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  def test_for_echo
    get '/'
    assert last_response.ok?
    assert last_response.body.include?("test.jpg")
  end

  def test_for_pictures
    pictures = load_pictures
    assert pictures.length > 0, "There are no pictures."
  end
end
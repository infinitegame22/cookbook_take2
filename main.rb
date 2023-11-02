require 'sinatra'

def load_pictures
  Dir.glob("public/*.{jpg,JPG}")
end

get '/' do
  @pictures = load_pictures
  erb :index
end



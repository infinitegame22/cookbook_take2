require 'sinatra'

def load_pictures
  Dir.glob("public/slideshow_pictures/*.{jpg,JPG}")
end

get '/' do
  @pictures = load_pictures
  erb :index
end



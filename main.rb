require 'sinatra'

# def load_pictures
#   Dir.glob("public/*.{jpg,JPG}")
# end

# get '/' do
#   @pictures = load_pictures
#   erb :index
# end

# post '/image' do
#   erb :upload
# end

get '/' do
  erb :homepage
end

get "/new" do
  erb :new
end

post "/create" do
  filename = params[:filename].to_s

  if filename.size == 0
    session[:message] = "A name is required."
    status 422
    erb :new
  else
    file_path = File.join(data_path, filename)

    File.write(file_path, "")
    session[:message] = "#{params[:filename]} has been created."

    redirect "/"
  end
end

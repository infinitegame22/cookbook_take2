require 'sinatra'
require "sinatra/content_for"
require "tilt/erubis"
# require "bcrypt"

before do
  #@storage = DatabasePersistence.new(logger)
end

class User
  attr_accessor :username, :password_digest

  def initialize(username, password)
    @username = username
    @password_digest = BCrypt::Password.create(password)
  end

  def self.find_by_username(username)
    # Replace this with your actual user lookup logic
    # This is just a basic example
    users.find { |user| user.username == username }
  end

  def self.users
    # Replace this with your actual user data store
    # This is just a basic example
    @users ||= []
  end

  def save
    # Replace this with your actual user save logic
    # This is just a basic example
    self.class.users << self
  end
end


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

get '/login' do
  "Hello World"
  erb :login
end

get '/signup' do
  redirect '/register'
end

get '/register' do
  erb :register
end

post '/register' do
  username = params[:username]
  password = params[:password]
  confirm_password = params[:confirm_password]

  # Basic validation
  if username.empty? || password.empty? || confirm_password.empty?
    session[:error] = 'Please fill in all fields.'
    redirect '/register'
  elsif password != confirm_password
    session[:error] = 'Passwords do not match.'
    redirect '/register'
  elsif User.find_by_username(username)
    session[:error] = 'Username is already taken. Please choose another one.'
    redirect '/register'
  else
    # Create a new user and save to your data store
    new_user = User.new(username, password)
    new_user.save

    session[:success] = 'Registration successful. Please log in.'
    redirect '/login'
  end
end
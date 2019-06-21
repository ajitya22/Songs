require './song'
require 'sass'
require 'sinatra'
# require 'shotgun'
require 'slim'
require 'shotgun'
# Sinatra::Base
# require './song'
# require 'sinatra/base'
configure do
	enable :sessions
	set :username, 'frank'
	set :password, 'sinatra'
	set :session_secret, "here be dragons"
end
get('/styles.css'){ scss :styles}
# set :port, 1234
get '/' do
  slim :home	
end
get '/about' do
	@title = "All about this website"
	slim :about
end
get '/contact' do
	@title = "For Queries"
	slim :contact
end
get '/login' do
	slim :login
end
post '/login' do
	if params[:username] == settings.username && params[:password] == settings.password
		session[:admin] = true
		redirect to('/songs')
	else
		session[:admin] = false
		# slim :login
		redirect to('/songs')
	end
end
get '/logout' do
	session.clear
	redirect to('/login')
end
get '/environment' do
	if Sinatra::Base.development?
		"development"
	elsif Sinatra::Base.production?
		"production"
	elsif Sinatra::Base.test?
		"test"
	else
		"Who knows what environment you're in!"
	end
end
not_found do
	status 404
	slim :not_found
end

# get '/songs' do
# 	@songs = Song.all
# 	slim :songs	
# end
# set :views, 'templates'

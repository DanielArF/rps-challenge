#rps_app.rb
require 'sinatra'
require './lib/rps_game.rb'
require 'byebug'

class RPSApp < Sinatra::Base

	set :views, proc { File.join(root, '..', 'views')}
	enable :sessions

	get '/' do 
		erb :index
	end

  run! if app_file == $0
end



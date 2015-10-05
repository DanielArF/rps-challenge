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

	post '/play_game' do
		session[:name] = params[:username]
		if session[:name] == ""
			redirect :'/'
		else
			erb :play_game
		end
	end

	post '/result' do
		session[:name] = params[:username]
	 	player_move = params[:player_move]
		self.result = self.play(player_move)
		erb :result
	end



	run! if app_file == $0
end



module RPS_Game

  attr_accessor :Scissors
  attr_accessor :Rock
  attr_accessor :Paper


	def self.bot_move
		%w(Rock Paper Scissors).sample
	end

  def self.play(player_move)
    case[player_move, bot_move]
      when['Rock','Scissors'],['Scissors','Paper'], ['Paper', 'Rock']
        result = "You won!"
      when ['Rock', 'Rock'], ['Scissors', 'Scissors'],  ['Paper', 'Paper']
        result = "Tie!"
      when ['Scissors','Rock'],['Paper','Scissors'], ['Rock', 'Paper']
        result = "Bot won!"
      end
    end
  end
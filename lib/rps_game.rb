module RPS_Game

  attr_accessor :result

	def self.bot_move
		%w(Rock Paper Scissors).sample
	end

  def self.RPS_Game(player_move)
    case[player_move, bot_move]
      when['Rock','Scissors']
        result = "You won!"
      end
    end
  end
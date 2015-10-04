require 'rps_game'


describe RPS_Game do

	it 'Players wins with rock over bot scissors' do
		allow(RPS_Game).to recevie(:bot_move).and_return('Scissors')
		result = RPS_Game.play('Rock')
		expect(result).to eq "You won!"
	end
end
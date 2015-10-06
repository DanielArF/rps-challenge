require './lib/rps_game.rb'


describe RPSGame do

  describe 'Player won!' do
    it 'Players wins with Rock over Bot Scissors' do
      allow(RPSGame).to receive(:bot_move).and_return('Scissors')
      result = RPSGame.play('Rock')
      expect(result).to eq "You won!"
    end

    it 'Players wins with Paper over Bot Rock' do
      allow(RPSGame).to receive(:bot_move).and_return('Rock')
      result = RPSGame.play('Paper')
      expect(result).to eq "You won!"
    end

    it 'Players wins with Scissors over Bot Paper' do
      allow(RPSGame).to receive(:bot_move).and_return('Paper')
      result = RPSGame.play('Scissors')
      expect(result).to eq "You won!"
    end
  end

  describe 'Tie!' do
    it 'Players and Bot plays Scissors' do
      allow(RPSGame).to receive(:bot_move).and_return('Scissors')
      result = RPSGame.play('Scissors')
      expect(result).to eq "Tie!"
    end

    it 'Players and Bot plays Rock' do
      allow(RPSGame).to receive(:bot_move).and_return('Rock')
      result = RPSGame.play('Rock')
      expect(result).to eq "Tie!"
    end

    it 'Players and Bot plays Paper' do
      allow(RPSGame).to receive(:bot_move).and_return('Paper')
      result = RPSGame.play('Paper')
      expect(result).to eq "Tie!"
    end
  end

  describe 'Bot won!' do
    it('Bot wins with Rock over Players Scissors') do
      allow(RPSGame).to receive(:bot_move).and_return('Rock')
      result = RPSGame.play('Scissors')
      expect(result).to eq "Bot won!"
    end

    it 'Bot wins with Paper over Players Rock' do
      allow(RPSGame).to receive(:bot_move).and_return('Paper')
      result = RPSGame.play('Rock')
      expect(result).to eq "Bot won!"
    end

    it 'Bot wins with Scissors over Players Paper' do
      allow(RPSGame).to receive(:bot_move).and_return('Scissors')
      result = RPSGame.play('Paper')
      expect(result).to eq "Bot won!"
    end
  end
end

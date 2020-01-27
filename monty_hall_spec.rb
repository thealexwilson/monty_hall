require_relative 'monty_hall'

describe 'monty_hall' do
  let(:times) { 10000 }
  let(:subject) { MontyHall.new(times) }

  context 'run' do
    it 'returns the correct switch win percentage' do
      subject.run
      expect(subject.switch_win_percentage).to be >= 66
    end

    it 'returns the correct initial win percentage' do
      subject.run
      expect(subject.initial_win_percentage).to be >= 33
    end
  end
end
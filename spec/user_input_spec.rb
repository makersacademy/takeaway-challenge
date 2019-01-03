require 'user_input'

RSpec.describe UserInput do

  subject(:user_input) { described_class.new }

  describe '#ask' do

    it 'returns true if the user says Yes' do
      allow(user_input).to receive(:gets).and_return("Yes")
      expect(user_input.ask("stake")).to be_truthy
    end

    it 'returns false if the user says No' do
      allow(user_input).to receive(:gets).and_return("No")
      expect(user_input.ask("stake")).to be_falsey
    end

  end

  describe '#quantity' do

    it 'returns the user input if not nil' do
      allow(user_input).to receive(:gets).and_return(3)
      expect(user_input.quantity).to eq 3
    end

    it 'returns 0 if input is nil' do
      allow(user_input).to receive(:gets).and_return(nil)
      expect(user_input.quantity).to eq 0
    end

  end

end

require 'menu'

describe Menu do

  subject(:menu) { described_class.new("Tonkotsu Ramen", 10) }

  describe '#initialize' do
    it 'has a dish variable' do
      expect(subject.dish).to eq "Tonkotsu Ramen"
    end

    it 'has a price variable for each dish' do
      expect(subject.price).to eq 10
    end

  end
end

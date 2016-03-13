require 'menu'

describe Menu do

  subject(:menu) { described_class.new }
  let(:dish)     { double :dish } #('food_name', 0) } #, name: 'Beef', price: 11}

  describe '#contents' do
    it '1. is a hash' do
      expect(menu.contents).to be_an(Hash)
    end

  end

  describe '#review' do
    it '2. returns the price of a dish' do
      # menu.contents
      allow(dish).to receive(:price).and_return(2)
      expect(menu.review(:beef)).to be_an(Integer) # needs a double!
    end
  end
end

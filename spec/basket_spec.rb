require 'basket'

describe Basket do

  subject(:basket) { described_class.new }

  describe '#add_dish' do
    it 'adds the dish to the basket summary' do
      basket.add_dish("Hedgeree")
      expect(basket.basket).to include "Hedgeree"
    end
  end

end

require 'basket'

describe Basket do

  subject(:basket) { described_class.new }
  let(:dish1) { double(:dish) }

  describe '#initialize' do
    it '0.0 initializes with an empty basket' do
      expect(basket.content).to be_empty
    end
  end

  describe '#add' do
    it '1.0 adds dish to basket' do
      basket.add(dish1)
      expect(basket.content).to include(dish1)
    end
  end

  describe '#remove' do
    it '2.0 removes dish from basket' do
      basket.add(dish1)
      basket.remove(dish1)
      expect(basket.content).not_to include(dish1)
    end
  end
end

require 'basket'

describe Basket do

  subject(:basket) { described_class.new }
  let(:dish1) { double(:dish) }
  let(:dish2) { double(:dish) }
  let(:dish3) { double(:dish) }


  describe '#initialize' do
    it '0.0 initializes with an empty basket' do
      expect(basket.content).to be_empty
    end
  end

  describe '#add' do
    it '1.0 adds dish(es) to the basket' do
      basket.add(dish1, dish2)
      expect(basket.content).to include(dish1 && dish2)
    end
  end

  describe '#remove' do
    it '2.0 removes dish(es) from the basket' do
      basket.add(dish1, dish2, dish3)
      basket.remove(dish2, dish3)
      expect(basket.content).not_to include(dish2 && dish3)
    end
  end
end

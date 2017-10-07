require 'basket'

describe Basket do

  let(:dish1) { 'wonton' }
  let(:dish1_price) { 3.46 }
  let(:dish2) { 'seaweed' }
  let(:dish2_price) { 3.57 }
  let(:menu) { double('menu',print: nil,items: { dish1 => dish1_price, dish2 => dish2_price }) }
 
  subject(:basket) { described_class.new }

  describe '#add' do

    it 'adds an item to the basket' do
      expect(basket.add(dish1, dish1_price)).to include [dish1, 1, dish1_price] 
    end

  end

  describe '#total' do

    it 'calculates the total cost of an order' do
      basket.add(dish1, dish1_price)
      basket.add(dish2, dish2_price)
      expect(basket.total).to eq dish1_price+dish2_price
    end

  end

  describe '#summary' do

    it 'prints the basket to a string' do
      basket.add(dish1, dish1_price)
      basket.add(dish1, dish1_price)
      basket.add(dish2, dish2_price)
      expect(basket.summary).to be_instance_of String
      p basket.summary
    end

  end

end

require 'order'

describe Order do
  subject(:order) { described_class.new }
  let(:menu) { double(:Menu) }
  let(:dish1) { double(:Dish, name: "Chicken", price: 1) }
  let(:dish2) { double(:Dish, name: "Fish", price: 2) }
  let(:dish3) { double(:Dish, name: "Steak", price: 3) }

  describe '#accept' do
    it 'accepts an order' do
      
    end
  end
end

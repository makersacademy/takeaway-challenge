require 'viewer'
require 'dish'

test_dish = Dish.new('Peperoni', 750)
expensive_pizza = Dish.new('Deluxe', 10_000)

describe Viewer do
  describe '#to_pounds' do
    it 'converts the price of a dish into viewable format' do
      expect(Viewer.new.view([test_dish])).to eq [{ 'Peperoni' => '£7.50' }]
    end

    it 'converts the price no matter how large the price' do
      expect(Viewer.new.view([expensive_pizza])).to eq [{ 'Deluxe' => '£100.00' }]
    end
  end
end

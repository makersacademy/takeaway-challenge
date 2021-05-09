require 'dish'

describe Dish do
  let(:dish) { Dish.new(name: 'Vegan Mixed Grill', price: 5.5) }

  describe '#to_s' do
    it 'returns dish name and price as a string' do
      expect(dish.to_s).to eq("Vegan Mixed Grill - £5.50")
    end
  end

  describe '#price' do
    it 'returns the price as a float' do
      expect(dish.price).to eq(5.5)
    end
  end
end

require "./lib/dish.rb"

describe Dish do
  context '#add' do
    it 'sets up dish hash to be added to order.basket' do
      dish = Dish.new("Jasmine Rice", 1, 2.50)
      expect(dish.add).to eq({ dish: "Jasmine Rice", price: 2.50, quantity: 1 })
    end
  end
end

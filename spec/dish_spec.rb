require 'dish.rb'
describe Dish do
  it 'gets created with a name and price' do
    name = "Pasta"
    price = 10.00
    dish = Dish.new(name, price)
    expect(dish.name).to eq name
    expect(dish.price).to eq price
  end
end

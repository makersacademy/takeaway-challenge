require 'dish'

describe Dish do

  describe '#name' do

  it 'initializes with a name' do
    dish = create_dish(name: "Pad Thai")
    expect(dish.name).to eq "Pad Thai"
  end

end

describe '#price' do

  it 'initializes with a price' do
    dish = create_dish(price: 5)
    expect(dish.price).to be 5
  end

end

end

def create_dish(arguments)
  name = arguments[:name]
  price = arguments[:price]
  Dish.new(name, price)
end

require './lib/dish'
require 'money'

describe Dish do
  let(:my_dish) { Dish.new("Rice", 100) }
  it 'can be initialized with a name' do
    expect(my_dish.name).to eq("Rice")
  end

  it 'can be initialized with a price' do
    expect(my_dish.price).to eq(100)
  end

  it 'can print the item and price formatted' do
    expect(my_dish.formatted).to eq("Rice: £1.00")
  end
end

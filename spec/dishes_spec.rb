require 'dishes'

describe Dish do
  
  it 'knows its name' do
    dish = Dish.new(:curry , 5)
    expect(dish.name).to eq :curry
  end

  it 'knows its price' do
    dish = Dish.new(:curry,5)
    expect(dish.price).to eq 5
  end
  
end
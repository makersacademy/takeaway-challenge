require 'dish'

describe Dish do
  it 'has a title' do 
    dish = Dish.new "Biriyani", 5.00
    expect(dish.title).to eq "Biriyani"
  end

  it 'has a price' do 
    dish = Dish.new "Chilli Chicken", 4.00
    expect(dish.price).to eq 4.00
  end
end
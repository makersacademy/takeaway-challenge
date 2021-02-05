require 'dish'

test_dish = Dish.new('Pollo Kiev', 800, 'Chicken, Garlic and Mushrooms')

describe Dish do
  it 'can have a name' do
    expect(test_dish.name).to eq "Pollo Kiev"
  end

  it 'can have a price in pence' do
    expect(test_dish.price).to eq 800
  end

  it 'can have an optional description' do
    expect(test_dish.description).to eq "Chicken, Garlic and Mushrooms"
  end
end
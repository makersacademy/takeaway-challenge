require 'menu'

describe Dish do
  
  let(:dish){ Dish.new "frosties",1 }

  it 'should be able to create a food item' do
    expect(dish.name).to eq "frosties"
  end

  it 'should be able to set a price for an item' do
    expect(dish.price).to eq 1
  end

end
require 'dish'

describe Dish do

  it 'Sets the @dish attribute to the first argument passed in when initialized' do
    dish = Dish.new('pizza', '£8')
    expect(dish.name).to eq 'pizza'
  end

  it 'Sets the @price attribute to the second argument passed in when initialized' do
    dish = Dish.new('pizza', '£8')
    expect(dish.price).to eq '£8'
  end

end

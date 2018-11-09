require 'Dish'

describe Dish do

  item = Dish.new("Chicken jalfrezi", 7.99)

  it 'has a name' do
    expect(item.name).to eq "Chicken jalfrezi"
  end

  it 'has a price' do
    expect(item.price).to eq 7.99
  end

end

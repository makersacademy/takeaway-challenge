require 'food_item'

describe FoodItem do
  it 'should have a name' do
    bolognese = FoodItem.new("Bolognese", 5)
    expect(bolognese.name).to eq "Bolognese"
  end
  it 'should have a price' do
    bolognese = FoodItem.new("Bolognese", 5)
    expect(bolognese.price).to eq 5
  end
end

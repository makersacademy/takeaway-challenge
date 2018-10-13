require 'food_item'

describe Item do
  it 'should have a name' do
    bolognese = Item.new("Bolognese", 5)
    expect(bolognese.name).to eq "Bolognese"
  end
  it 'should have a price' do
    bolognese = Item.new("Bolognese", 5)
    expect(bolognese.price).to eq 5
  end
end

require 'dish'

describe Dish do
  it 'prints the dish name and price' do
    dish = Dish.new("Margherita", 7)
    expect(dish.print).to eq "The Margherita costs £7"
  end
end

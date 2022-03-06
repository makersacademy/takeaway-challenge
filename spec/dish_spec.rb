require 'dish'

describe Dish do
  let(:dish) { Dish.new('Margherita', 7) }
  
  it 'prints the dish name and price' do
    expect(dish.print).to eq "The Margherita costs £7"
  end
end

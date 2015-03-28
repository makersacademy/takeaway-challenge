require 'dish'

describe Dish do
  let(:dish) { described_class.new 'Carbonara', 5.80 }
  it 'has a name' do
    expect(dish.name).to eq 'Carbonara'
  end
  it 'has a price' do
    expect(dish.price).to eq 5.80
  end
end

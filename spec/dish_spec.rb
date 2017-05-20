require 'dish'

describe Dish do

  subject(:dish) { described_class.new :SweetPotatoes, 3 }

  it 'returns the name of the dish' do
    expect(dish.name).to eq :SweetPotatoes
  end
  it 'returns the price of the dish' do
    expect(dish.price).to eq 3
  end
end

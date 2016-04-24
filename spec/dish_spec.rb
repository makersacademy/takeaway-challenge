require 'dish'

describe Dish do

  subject(:dish) {described_class.new(name: "Tikka Masala", price: 6.95)}

  it 'returns name of dish' do
    expect(dish.name).to eq "Tikka Masala"
  end

  it 'returns price of dish' do
    expect(dish.price).to eq 6.95
  end

end

require 'dish'

describe Dish do

  subject(:dish) { described_class.new('Samosa', 1.0) }

  it 'returns price as a float' do
    expect(dish.price).to be_a Float
  end

  it 'prints its name and price as formatted string' do
    expect(dish.print).to eq 'Samosa, £1.0'
  end

end

require 'dish'

describe Dish do

  let(:dish) { described_class.new('name', 'price') }

  it 'instantiates a dish with a name and a price' do
    expect([dish.name, dish.price]).to eq ['name', 'price']
  end

end

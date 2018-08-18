require 'dish'

describe Dish do

  let(:dish) { described_class.new('name', 'price') }

  it 'creates a new dish' do
    expect(described_class).to respond_to(:new)
  end

  it 'creates a dish with a name and a price' do
    expect([dish.name, dish.price]).to eq ['name','price']
  end

end

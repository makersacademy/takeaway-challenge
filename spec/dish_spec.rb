require 'rspec'
require 'dish'

describe Dish do

  let(:chicken_tikka) { described_class.new :C3, 'Chicken tikka massala', 380 }

  it 'has an order code' do
    expect(chicken_tikka.order_code).to eq :C3
  end

  it 'has a name/description' do
    expect(chicken_tikka.description).to eq 'Chicken tikka massala'
  end

  it 'has a price in pence' do
    expect(chicken_tikka.price).to eq 380
  end

end
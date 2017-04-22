require 'dish'

describe Dish do

  let(:order) { described_class.new("Salad Nicoise", 10.99) }

  it 'responds to description' do
    expect(order).to respond_to(:description)
  end

  it 'responds to price' do
    expect(order).to respond_to(:price)
  end

  it 'knows it\'s description' do
    expect(order.description).to eq "Salad Nicoise"
  end

  it 'knows it\'s to price' do
    expect(order.price).to eq 10.99
  end


end

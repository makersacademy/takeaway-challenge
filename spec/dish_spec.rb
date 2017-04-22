require 'dish'

describe Dish do

  let(:dish) { described_class.new("Salad Nicoise", 10.99) }

  it 'responds to description' do
    expect(dish).to respond_to(:name)
  end

  it 'responds to price' do
    expect(dish).to respond_to(:price)
  end

  it 'knows it\'s description' do
    expect(dish.name).to eq "Salad Nicoise"
  end

  it 'knows it\'s to price' do
    expect(dish.price).to eq 10.99
  end


end

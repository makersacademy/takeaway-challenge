require 'dish'

describe Dish do
  let(:name) { :stew }
  let(:price) { 3.99 }
  let(:dish) { Dish.new(name, price) }

  it 'set the name when you create it' do
    expect(dish.name).to eq(name)
  end

  it 'set the price when you create it' do
    expect(dish.price).to eq(price)
  end

  it 'errors if created with an empty string for the name' do
    expect { Dish.new("", price) }.to raise_error(ArgumentError, 'dish name must not be empty')
  end

  it 'errors if created with a price <= 0' do
    expect { Dish.new(name, 0) }.to raise_error(ArgumentError, 'dish price must be greater than 0')
  end
end

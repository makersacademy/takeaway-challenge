require 'simplecov'
SimpleCov.start
require 'dish'

describe Dish do

  let(:dish) { Dish.new("Wolf Nipple Chips", 4.99) }

  it 'should have a name' do
    expect(dish.name).to eq("Wolf Nipple Chips")
  end

  it 'should have a price' do
    expect(dish.price).to eq 4.99
  end

end
require './lib/dish'

describe Dish do

let(:dish) { Dish.new("Fish and Chips", "£5.00") }

  it 'initializes with a dish name' do
    expect(dish.name).to eq 'Fish and Chips'
  end

  it 'initializes with a dish price' do
    expect(dish.price).to eq '£5.00'
  end
end

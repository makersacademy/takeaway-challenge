require 'dishes'

describe Dishes do

  let(:dish_names) { double :dish_names }
  let(:dish_prices) { double :dish_prices }

  let(:dishes) { Dishes.new(dish_names, dish_prices) }

  it "stores dish names" do
    expect(dishes.dish_names).to eq(dish_names)
  end

  it "stores dish prices" do
    expect(dishes.dish_prices).to eq(dish_prices)
  end
end

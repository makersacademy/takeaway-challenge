require 'dish'

describe Dish do
  it 'returns the name of the dish' do
    dish = Dish.new("dish")
    expect(dish.dish).to eq("dish")
  end
end

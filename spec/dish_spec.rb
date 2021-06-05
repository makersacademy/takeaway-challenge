require 'dish'

describe Dish do
  icecream = Dish.new("vanilla", 5.0)
  it 'should make dishes with a name' do
    expect(icecream.name).to eq("vanilla")
  end
  it 'should make dishes with a price' do
    expect(icecream.price).to eq(5.0)
  end
end
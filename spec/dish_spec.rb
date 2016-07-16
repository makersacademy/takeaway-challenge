require 'dish'

describe Dish do
  subject(:dish) { described_class.new("fish", 14) }

  it 'knows its name' do
    expect(dish.name).to eq("fish")
  end

  it 'knows its price' do
    expect(dish.price).to eq(14)
  end
end

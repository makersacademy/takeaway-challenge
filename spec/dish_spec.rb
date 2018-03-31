require 'dish'

describe Dish do
  subject(:dish) { described_class.new('burger', 4.00) }

  it "has a name" do
    expect(dish.name).to eq 'burger'
  end

  it "has a price" do
    expect(dish.price).to eq 4.00
  end
end

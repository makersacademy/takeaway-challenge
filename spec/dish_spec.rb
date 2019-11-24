require 'dish'

describe Dish do
  let(:name) { "Chicken Sandwich" }
  let(:price) { 5.50 }
  subject(:dish) { described_class.new(name, price) }

  it "should have a name" do
    expect(dish.name).to eq name
  end

  it "should have a price" do
    expect(dish.price).to eq price
  end
end

require "dish"

describe Dish do
  let(:dish) { described_class.new("Pizza", 8.50) }
  it "#price returns dish price" do
    expect(dish.price).to eq 8.50
  end
  it "#name returns dish name" do
    expect(dish.name).to eq "Pizza"
  end
end

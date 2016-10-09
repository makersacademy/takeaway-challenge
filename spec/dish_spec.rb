require "dish"

describe Dish do

  subject(:dish) { described_class.new("Chicken Teryiaki", 5) }

  it "has a name" do
    expect(dish.name).not_to be nil
  end
  it "has a price" do
    expect(dish.price).not_to be nil
  end
end

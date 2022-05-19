require_relative '../lib/dish'

describe Dish do
  subject(:dish) { described_class.new("Fish", 2.0) }

  it "has a name" do
    expect(dish.name).to eq "Fish"
  end
  it "has a price" do
    expect(dish.price).to eq 2.0
  end

end

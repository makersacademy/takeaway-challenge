require "Dish"

describe Dish do
  let(:dish) { Dish.new("Curry", 8) }
  it { expect(dish.name).to eq "Curry" }
  it { expect(dish.price).to eq 8 }
end

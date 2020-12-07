require './lib/dish.rb'

describe Dish do

let (:dish) {Dish.new("bolognaise", 7)}

  it "takes two arguments on creation" do
    expect(described_class).to respond_to(:new).with(2).arguments
  end
  it "is given a name, which can be accessed" do
    expect(dish.name).to eq("bolognaise")
  end
  it "is given a price, which can be accessed" do
    expect(dish.price).to eq(7)
  end
end

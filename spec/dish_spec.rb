require "dish"

describe Dish do

  let(:name) {double :name}
  let(:price) {double :price}
  let(:dish) {Dish.new(:name, :price)}

  it "expects a dish to have a name" do
    expect(dish.name).to eq :name
  end

  it "expects a dish to have a price" do
    expect(dish.price).to eq :price
  end
end

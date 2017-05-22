require "dish"

describe Dish do
  let(:name) { "Saag Paneer" }
  let(:description) { "Cheesy green goodness" }
  let(:price) { 4 }
  subject(:dish) { described_class.new(name, description, price) }

  it "has a name" do
    expect(dish.name).to eq name
  end

  it "Has a description" do
    expect(dish.description).to eq description
  end

  it "Has a price" do
    expect(dish.price).to eq price
  end
end

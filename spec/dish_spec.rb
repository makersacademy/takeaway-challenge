require "dish"

describe Dish do
  let(:name) { "Saag Paneer" }
  let(:description) { "Cheesy green goodness" }
  subject(:dish) { described_class.new(name, description) }

  it "has a name" do
    expect(dish.name).to eq name
  end

  it "Has a description" do
    expect(dish.description).to eq description
  end
end

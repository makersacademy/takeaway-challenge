require 'dishes'

describe Dishes do
  # let(:dish){ Dish.new }

  it "adding dish name" do
    dishes = Dishes.new("Sandwich", 3)
    expect(dishes.name).to eq "Sandwich"
  end

  it "adding dish price" do
    dishes = Dishes.new("Sandwich", 3)
    expect(dishes.price).to eq 3
  end

end

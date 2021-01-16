require "dish"

describe Dish do

  subject(:dish) { Dish.new("Pilau rice", 250)}

  it "has a name" do
    expect(dish.name).to eq "Pilau rice"
  end

  it "has a price" do
    expect(dish.price).to eq 2.50
  end


end
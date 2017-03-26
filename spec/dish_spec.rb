require "dish"

describe Dish do

  subject(:dish) {described_class.new("Fish", 5.5)}

  it "checks that the dish has a name" do
    expect(dish.dish_name).to eq "Fish"
  end

  it "checks that the dish has a price" do
    expect(dish.dish_price).to eq 5.5
  end


end

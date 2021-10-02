require 'dish'

describe Dish do
  let(:dish) { Dish.new(name: "Chicken Tikka", price: 5.00)}

  it "should show it's dish name" do
    expect(dish.name).to eq "Chicken Tikka"
  end

  it "should show dish price" do
    expect(dish.price).to eq 5.00
  end

  it "should have a default quantity of 1" do
    expect(dish.quantity).to eq 1
  end
end
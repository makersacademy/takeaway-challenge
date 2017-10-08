require 'dish'

describe Dish do
  let(:dish) { Dish.new(name: "Tzatziki", price: 3.40) }
  let(:default_currency) { "£" }
  it "can have a name" do
    expect(dish.name).to eq("Tzatziki")
  end

  it "can have a price" do
    expect(dish.price).to eq(3.40)
  end

  it "#to_s returns a string representation of the instance object Dish" do
    expect(dish.to_s).to eq "Tzatziki: £3.40"
  end
end
  
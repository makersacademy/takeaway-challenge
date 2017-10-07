require 'dish'

describe Dish do
  let(:dish) { Dish.new(name: "Tzatziki", price: 3.40) }
  it "can have a name" do
    expect(dish.name).to eq("Tzatziki")
  end

  it "can have a price" do
    expect(dish.price).to eq(3.40)
  end
end
  
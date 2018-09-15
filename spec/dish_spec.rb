require 'dish'

describe Dish do
  it "creates a menu item given its name and price" do
    dish = Dish.new("Lasagna", 10)
    expect(dish.item).to eq({ "Lasagna" => 10 })
  end
end

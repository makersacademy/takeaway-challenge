
require "./lib/restaurant"
require "./lib/menu"
require "./lib/dish"

describe Restaurant do

  subject do
    dishes = [Dish.new("Burger", 8)]
    menu = Menu.new(dishes)
    Restaurant.new(menu)
  end

  it "has a menu" do
    expect(subject.menu.dishes.length).to eq(1)
  end
end
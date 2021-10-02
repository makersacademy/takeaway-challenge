require "takeaway"
require "menu"
describe Takeaway do
  let(:dishes) { { "burger" => 6.50, "fries" => 1.50 } }
  let(:menu_double) { double(:menu, dishes: dishes, list: dishes) }

  it "displays the menu with the dishes and prices" do
    takeaway = Takeaway.new(menu_double)
    expect(takeaway.list_menu).to eq(dishes)
  end
  it "can order some number of several available dishes" do
    takeaway = Takeaway.new(menu_double)
    takeaway.add("burger")
    takeaway.add("fries")
    expect(takeaway.basket).to eq ["burger", "fries"]
  end
  it "raises an error if the chosen dish isnt on the menu" do
    takeaway = Takeaway.new(menu_double)
    expect { takeaway.add("sushi") }.to raise_error "sushi is not on the menu"
  end
end

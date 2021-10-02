require "takeaway"
require "menu"
describe Takeaway do
  let(:dishes) { { "burger" => 6.50, "fries" => 1.50 } }
  let(:menu_double) { double(:menu, dishes: dishes, list: dishes) }
  let(:takeaway) { Takeaway.new(menu_double) }
  before do
    takeaway.add("burger")
    takeaway.add("fries")
  end
  it "displays the menu with the dishes and prices" do
    expect(takeaway.list_menu).to eq(dishes)
  end
  it "can order some number of several available dishes" do
    expect(takeaway.basket).to eq ["burger", "fries"]
  end
  it "raises an error if the chosen dish isnt on the menu" do
    expect { takeaway.add("sushi") }.to raise_error "sushi is not on the menu"
  end
  it "gives you the total" do
    expect(takeaway.total).to eq 8.00
  end
  it "lets you check your total matches the given total" do
    expect(takeaway.check_total(8.00)).to be_truthy
  end
end

require "takeaway"
require "menu"
describe Takeaway do
  let(:menu) { double(:menu, list: dishes) }
  let(:dishes) { { burger: 6.50 } }
  it "prints the menu with the dishes and prices" do
    takeaway = Takeaway.new(menu)
    expect(takeaway.list_menu).to eq(dishes)
  end
end

# describe Menu do
#   menu = Menu.new(dishesprices)
#   expecy menu.to receieve (dishesprices) and equal {chicken,bacon

#   }

# require "takeaway"
# describe Takeaway do
#   let(:menu) { double(:menu, list: "Burger: £6.00") }
#   it "shows the menu with the dishes and prices" do
#     takeaway = Takeaway.new(menu)
#   expect(takeaway.list_menu).to eq("Burger: £6.00")
# end
# end

# describe Menu do
#   menu = Menu.new("Burgers", "£2.00")
#   it "stores the dishes" do
#     expect(menu.dish).to eq "Burgers"
#   end
#   it "stores the prices" do
#     expect(menu.price).to eq "£2.00"
#   end
# end
# describe TakeAway do
#   let(:menu) { double :menu_double }
#   it "shows you the menu" do
#     takeaway = TakeAway.new(:menu_double)
#     allow(takeaway).to receive(:menu_double) {"Burgers: £3.00"}
#     expect(takeaway.view_list).to eq ("Burgers: £3.00")
#   end
# end

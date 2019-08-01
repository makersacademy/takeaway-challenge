require 'takeaway'
describe Takeaway do


# let(:printed_menu) {"Sweets: £1"}

it "shows a list of dishes and prices" do
  menu_double = double :menu, print: "this will be the printed menu"
  takeaway = Takeaway.new(menu_double)
  expect(takeaway.print_menu).to eq "this will be the printed menu"
end

end








# require 'takeaway'
#
# describe Takeaway do
# subject(:takeaway) { described_class.new }
#
# let(:menu) { double(:menu, print: printed_menu) }
# let(:printed_menu) {"Sweets: £1"}
#
# let(:dishes) { {chicken: 2, fish: 1} }
#
#
#   it "shows the menu with dishes and prices" do
#     expect(takeaway.print_menu).to eq(printed_menu)
#   end
#
#
#   # it "can select some number of available dishes" do
#   #   takeaway.order(dish)
#   #   expect(takeaway.view_basket).to eq dish
#   # end
#
# end

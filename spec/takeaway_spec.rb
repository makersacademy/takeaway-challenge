# require 'takeaway'
#
# describe Takeaway do
#   subject(:takeaway) { described_class.new(restaurant_menu) }
#   let(:restaurant_menu) { double :menu, dishes: dishes, print_menu: formatted_menu }
#   let(:dishes) do
#     {
#       chicken: 2.99,
#       beef: 3.49,
#     }
#   end
#   let(:formatted_menu) { "Chicken - £3.00, Beef: £3.49" }
#
#   describe '#new' do
#     it 'Should initialize with an argument menu' do
#       expect(takeaway.menu.dishes).to eq dishes
#     end
#   end
#
#   describe '#print_menu' do
#     it 'Should print the menu' do
#       expect(takeaway.print_menu).to eq "Chicken - £3.00, Beef: £3.49"
#     end
#   end
#
# end


# 1.  show me the menu
#
# 2.  here is my order
#     order stores itself
#
# 3.  order calculates total
#     order checks total matches customer total

require 'cafe'
require 'menu'
require 'order'

describe 'requests menu' do
  it 'shows me the menu' do
    cafe = Cafe.new
    expect(cafe.read_menu).to eq "What would you like to order?"
  end
end

# describe 'ordering' do
#   it 'receives an order' do
#     cafe = Cafe.new
#     "CHIA_PUDDING".order
#     adds key value pair to order hash
#   end
# end

# describe 'places order' do
#   it 'receives my order and stores it' do
#     cafe = Cafe.new
#     my_order = "something"
#     expect(cafe.receive_order(my_order)).to eq "something"
#   end
# end

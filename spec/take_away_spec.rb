require 'take_away'
require 'menu'
require 'order'


describe Takeaway do

subject(:takeaway_new) do
  described_class.new("fabios","+555222","7 james street")
end

let(:order_klass) { double :order_klass, new: order }
let(:menu_klass) { double :menu_klass, new: menu }

  it 'Can create a new Menu'  do
    takeaway = takeaway_new
    takeaway.create_menu
    expect(takeaway.menus[0].menu_items[0].item).to eq("CHICKEN CACCIATORE")
  end

  it 'Can delete menu from menus'  do
    takeaway = takeaway_new
    takeaway.create_menu
    takeaway.delete_menu(takeaway.menus[0])
    expect(takeaway.menus).to eq([])
  end

  it 'Can create a new Order with empty cart'  do
    takeaway = takeaway_new
    takeaway.create_order("jim","7","north road","nw10","+555444")
    expect(takeaway.orders[0].cart).to eq([])
  end

  it 'Can delete order from orders'  do
    takeaway = takeaway_new
    takeaway.create_order("jim","7","north road","nw10","+555444")
    takeaway.delete_order(takeaway.orders[0])
    expect(takeaway.orders).to eq([])
  end

end

require_relative '../../lib/take_away.rb'

describe 'User Stories' do

# As a customer
# So that I can check if I want to order something
# I would like to see a list of dishes with prices

 it 'See a list of dishes with prices' do
   takeaway = Takeaway.new("fabios","+555222","7 james street")
   takeaway.create_menu
   expect(takeaway.menus[0].menu_items.map.each(&:item))
     .to eq(["CHICKEN CACCIATORE", "VEGGIE BURGER", "TURKEY MILANESE",
        "GENNARO’S FAMOUS PORCHETTA", "ITALIAN STEAK FRITES",
        "LAMB CHOPS SCOTTADITTO", "HARISSA-SPICED AUBERGINE"])
 end

# As a customer
# So that I can order the meal I want
# I would like to be able to select some number of several available dishes

it 'Select some number of several available dishes ' do
  menu = Menu.new
  order = Order.new("jim","7","north road","nw10","+555444")
  order.add_to_cart(menu,menu.itemised[0],2)
  order.add_to_cart(menu,menu.itemised[0],1)
  expect(order)
    .to have_attributes(cart:[[["CHICKEN CACCIATORE", "£13.95"], 2],
      [["CHICKEN CACCIATORE", "£13.95"], 1]] )
end

# As a customer
# So that I can verify that my order is correct
# I would like to check that the total I have been given matches the sum of
# the various dishes in my order

it 'Check that the total...matches the sum of the...dishes in my order' do
  takeaway = Takeaway.new("fabs","555","7 north road")
  menu = Menu.new
  order = Order.new("jim","7","north road","nw10","+555444")
  order.add_to_cart(menu,menu.itemised[0],2)

  expect(order.total). to eq(27.9)
end

# As a customer
# So that I am reassured that my order will be delivered on time
# I would like to receive a text such as "Thank you! Your order was placed
# and will be delivered before 18:52" after I have ordered

it 'I would like to receive a text...after I have ordered' do
  takeaway = Takeaway.new("fabios","+555","7 james street")
  takeaway.create_order("jim","7","north road","nw10","+555")
  menu = Menu.new
  takeaway.orders[0].add_to_cart(menu,menu.itemised[0],2)
  orders = takeaway.orders
  expect(takeaway.finalise_order(orders[0])).to eq("Sent message to jim")
end

end

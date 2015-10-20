require './lib/dish'
require './lib/menu'
require './lib/order'
require './lib/takeaway'
require './lib/text_messenger'
require 'capybara/rspec'

feature "Joe's takeaway" do

  dish1 = Dish.new('Egg Rice',3.2)
  dish2 = Dish.new('Chicken Curry',4.5)
  dish3 = Dish.new("Joe's Special",11.99)
  menu = Menu.new("Joe's Menu")
  menu.add_dish(dish1)
  menu.add_dish(dish2)
  menu.add_dish(dish3)
  joes_takeaway = TakeAway.new(menu)

  scenario "Takeaway's Menu has three dishes on it" do
  	expect(joes_takeaway.menu.dishes.count).to eq(3)
  end

  scenario "The menu contains a dish that was added to it" do
    expect(joes_takeaway.menu.dishes.include?(dish3)).to eq(true)
  end

  scenario "The menu can be displayed with correct information" do
    menu_display = joes_takeaway.menu.display
    expected_display = "                    Joe's Menu                    \n"\
    "\nEgg Rice                                  £   3.20\nChicken Curry    "\
    "                         £   4.50\nJoe's Special                       "\
    "      £  11.99\n"
    expect(menu_display).to eq(expected_display)
  end

  order1 = Order.new
  order1.add_to_order(dish1,3,joes_takeaway.menu)
  order1.add_to_order(dish2,1,joes_takeaway.menu)
  joes_takeaway.take_order(order1)

  scenario "An order can be made based on takeaway's menu" do
    expect(joes_takeaway.orders).to eq([order1])
  end

  scenario "Order information can be displayed" do
    display_order = joes_takeaway.orders.first.display_order_on_receipt
    expected_display = "                  Order Details\n\nEgg Rice @ 3.2 x 3"\
    "                        £   9.60\nChicken Curry @ 4.5 x 1               "\
    "    £   4.50\n--------------------------------------------------\nTotal "\
    "                                    £  14.10"
    expect(display_order).to eq(expected_display)
  end

  scenario "Raises error when trying to order dish not on menu" do
    dish4 = Dish.new("Cryspy Pigeon",1.99)
    expect{order1.add_to_order(dish4,10,menu)}.to raise_error("Not on menu")
  end

  text_messenger = TextMessenger.new

  scenario "Can send a text with order confirmation to the customer" do
    expect(text_messenger).to respond_to(:send_order_text).with(2).argument
  end

  scenario "Can take multiple orders from the menu" do
    order2 = Order.new
    order2.add_to_order(dish3,1,joes_takeaway.menu)
    joes_takeaway.take_order(order2)
    order3 = Order.new
    order3.add_to_order(dish2,2,joes_takeaway.menu)
    joes_takeaway.take_order(order3)
    expect(joes_takeaway.orders.count).to eq(3)
  end

end

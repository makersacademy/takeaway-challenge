require_relative 'dish'
require_relative 'menu'
require_relative 'order'
require_relative 'text'

MENU_ITEMS = [
    Dish.new(name: 'Test Item 1', description: 'Test item 1 description', price: '10.95'),
    Dish.new(name: 'Test Item 2', description: 'Test item 2 description', price: '5.99'),
    Dish.new(name: 'Test Item 3', description: 'Test item 3 description', price: '2.50'),
    Dish.new(name: 'Test Item 4', description: 'Test item 4 description', price: '12.00')
]

module TakeAway
  Dish = ::Dish
  Menu = ::Menu
  Order = ::Order
  def self.init
    puts "Testing Menu print to screen"
    puts "----------------------------"
    menu_1 = Menu.new
    MENU_ITEMS.each { |menu_item| menu_1.add_dish(menu_item) }
    puts menu_1.view_menu
    puts ""
    puts ""
    puts "Testing Order print to screen"
    puts "-----------------------------"
    order_1 = Order.new
    order_1.add_item(MENU_ITEMS[0])
    order_1.add_item(MENU_ITEMS[1])
    order_1.add_item(MENU_ITEMS[2])
    puts order_1.view_order
    puts "-----------------------------"
    puts "Total: #{order_1.total}"
    new_message = Text
    new_message.init
    new_message.text_send(order_1.total)
  end
end

TakeAway.init

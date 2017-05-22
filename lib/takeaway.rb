require_relative 'restaurant'
require_relative 'menu'
require_relative 'item'
require_relative 'interface'
require_relative 'printer'
require_relative 'cart'
require_relative 'order'
require_relative 'messenger'
require 'dotenv/load'
Dotenv.load('settings.env')

class Takeaway

  attr_reader :interface, :restaurant, :cart, :order, :messenger

  def initialize(restaurant_name)
    @restaurant = Restaurant.new(restaurant_name, self)
    @interface = Interface.new(@restaurant)
    @cart = Cart.new
    @order
    @messenger
  end

  def add_item_to_cart
    interface.printer.input_item_selection
    item_selection = STDIN.gets.chomp.to_i
    interface.printer.input_quantity
    quantity = STDIN.gets.chomp.to_i
    quantity.times { cart.select_item(restaurant.menu.items[item_selection - 1]) }
  end

  def checkout
    @order = Order.new(@cart, @restaurant)
  end

  def confirm
    @messenger = Messenger.new
    messenger.send(self.interface.printer.print_confirmation)
    puts (interface.printer.print_confirmation)
  end

end


#Run Program Loop
takeaway = Takeaway.new ('Beef & Beer')
takeaway.restaurant.menu.add_item('Burger', 3)
takeaway.restaurant.menu.add_item('Beer', 2)
takeaway.interface.interactive_menu

require 'envyable'
require 'twilio-ruby'
require_relative './sms'
require_relative './menu'
require_relative './cart'

class Restaurant

  def initialize
    @menu = Menu.new #[{dish: 'fries', price: 1.0}, {dish: 'fish', price: 1.5}]
    @cart = Cart.new
    @total = 0
    #TODO add option to initialize with yaml file
  end

  def read_menu
    greeting
    @menu.print
    instructions
  end

  def select(item_number, amt =1)
    fail "You entered a number that does not corespond to our menu :( Please try again." if (item_number -1) > @menu.number_of_dishes
    fail "You entered an invalid quantity. Enter a number for the quantity" if !amt.is_a?(Numeric)
    @cart.add(@menu.select(item_number,amt))
  end

  def cart
    fail "Cart is empty" if @cart.is_empty?
    @cart.check
  end

  def total
    @cart.total
  end

  def place_order
    Sms.send
  end

  private

  def greeting
    "Welcome! Here are the items that we have and their prices"
  end

  def instructions
    "To add an item to your cart type 'resturant_name.select(item_number, quantity)'"
  end
end

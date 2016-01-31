require 'dotenv'
require_relative 'menu_item'
require_relative 'order'

class Restaurant
  extend Forwardable

  attr_reader :order_history
  def_delegator :@order, :confirm_order, :confirm_order

  MENU = {'salt and pepper squid': 3.50,
            'chicken satay': 4.50,
            'prawn summer rolls': 5.60,
            'sticky pork ribs': 5.00,
            'chilli soft shell crab': 7.50}

  def initialize(menu_item_klass = MenuItem, order_klass = Order)
    @credentials = Dotenv.load
    @menu_item_klass = menu_item_klass
    @order_history = {}
    @order_klass = order_klass
  end

  def show_menu
    @itemized_menu = create_menu(MENU)
    @itemized_menu.each {|menu_item| puts "#{menu_item.name.to_s}" " => " "#{menu_item.price},"}
  end

   def place_order(item, quantity=1)
     create_order
     item_to_add = match_menu_item(item)
    #  raise "Total does not match the total of items ordered" if total != (item_to_add.price * quantity)
     @order.add_item(item_to_add, quantity)
   end




  private

  def create_menu(menu)
    menu.collect {|name, price| @menu_item_klass.new(name.to_s, price) }
  end

  def match_menu_item(item)
    @itemized_menu.select {|menu_item| menu_item.name==item}.pop
  end

  def create_order
    @order = @order_klass.new
  end





end

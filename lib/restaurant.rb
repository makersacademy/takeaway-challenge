require_relative 'menu_item'
require_relative 'order'

class Restaurant
  
  extend Forwardable
  def_delegator :@order, :confirm_order, :confirm_order
  def_delegator :@order, :show_order, :show_order

  MENU = {'salt and pepper squid': 3.50,
            'chicken satay': 4.50,
            'prawn summer rolls': 5.60,
            'sticky pork ribs': 5.00,
            'chilli soft shell crab': 7.50}

  def initialize(menu_item_klass = MenuItem, order_klass = Order)
    @menu_item_klass = menu_item_klass
    @order = order_klass.new
  end

  def show_menu
    @itemized_menu = create_menu(MENU)
    @itemized_menu.each {|menu_item| puts "#{menu_item.name}" " => " "#{menu_item.price},"}
  end

 def place_order(item, quantity=1)
   item_to_add = match_menu_item(item)
   @order.add_item(item_to_add, quantity)
 end

  private

  def create_menu(menu)
    menu.collect {|name, price| @menu_item_klass.new(name.to_s, price) }
  end

  def match_menu_item(item)
    @itemized_menu.select {|menu_item| menu_item.name==item}.pop
  end

end

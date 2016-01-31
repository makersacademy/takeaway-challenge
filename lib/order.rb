require './lib/menu_module.rb'
require './lib/text_module.rb'

class Order

  include Menu, Text

  attr_reader :current_order

  def initialize
    @current_order = {}
    super
  end

  def add_to_order(item, quantity, price)
    raise "Item not on menu" unless on_menu?(item)
    raise "Incorrect price, order rejected" unless correct_price?(item, quantity, price)
    order = {item => quantity}
    update_order(order)
  end

  def on_menu?(item)
    self.view_menu.has_key?(item.downcase)
  end

  def update_order(order)
    @current_order.merge!(order)
  end

  def correct_price?(item, quantity, price)
    price == self.view_menu[item] * quantity
  end

end

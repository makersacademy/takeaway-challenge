require './lib/menu_module.rb'

class Order

  include Menu

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
    self.starters.has_key?(item.downcase)
  end

  def update_order(order)
    @current_order.merge!(order)
  end

  def correct_price?(item, quantity, price)
    if price == self.starters[item] * quantity
      true
    else
      false
    end
  end

end

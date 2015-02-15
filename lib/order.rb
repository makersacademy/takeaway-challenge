require 'rubygems'
require 'twilio-ruby'

class Order

  def initialize
    @customer_order = []
  end

  def place_order(item, quantity, menu)
    raise "Cannot have 0 quantity" if quantity == 0
    item_price = menu.menu_items[item]
    item_total = sub_total(item_price, quantity)
    @customer_order << [item, quantity, item_total]
  end

  def customer_order
    @customer_order
  end

  def total_order

  end

  def sub_total(item_price,quantity)
    item_price * quantity
  end




end



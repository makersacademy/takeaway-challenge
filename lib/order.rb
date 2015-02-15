require 'rubygems'
require 'twilio-ruby'

class Order

  def initialize
    @customer_order = {}
  end

  def place_order(item, quantity, menu)
    raise "Cannot have 0 quantity" if quantity == 0
    item_price = menu.menu_items[item]
    item_total_qty_price = sub_total(item, quantity, item_price)
    @customer_order[item] =  item_total_qty_price
  end

  def customer_order
    @customer_order
  end

  def total_order

  end

  def sub_total(item, quantity, item_price)
    qty = quantity + item_quanity_ordered(item)
    item_total = (item_price * quantity) + item_total_price(item)
    accum_order = [qty, item_total]
  end

  def item_quanity_ordered(item)
    if customer_order[item].nil?
      return 0
    else
      customer_order[item][0]
    end
  end

  def item_total_price(item)
    if customer_order[item].nil?
      return 0
    else
      customer_order[item][1]
    end
  end




end



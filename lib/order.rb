require 'rubygems'
require 'twilio-ruby'

class Order

  def initialize
    @customer_order = {}
  end

  def place_order(item, quantity, menu)
    raise "Cannot have 0 quantity" if quantity == 0
    rasie "We don't sell that" if menu.menu_items[item].nil?
    item_price = menu.menu_items[item]
    item_total_qty_price = sub_total(item, quantity, item_price)
    @customer_order[item] =  item_total_qty_price
  end

  def customer_order
    @customer_order
  end

  def total_order_amount
    customer_order.inject(0) { |memo, value| memo + value[1][1]}
  end

  def order_errors(item, quantity)

  end

  private def sub_total(item, quantity, item_price)
    qty = quantity + item_details(item, :quantity)
    item_total = (item_price * quantity) + item_details(item, :total)
    accum_order = [qty, item_total]
  end

  private def item_details(item, options)
    return 0 if customer_order[item].nil?
    case options
      when :quantity
        customer_order[item][0]
      when :total
         customer_order[item][1]
    end
  end


end



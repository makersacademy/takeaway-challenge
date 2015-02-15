require 'rubygems'
require 'twilio-ruby'

class Order

  def initialize
    @customer_order = {}
  end

  def place_order(item, quantity, total, menu)
    raise "Cannot have 0 quantity" if quantity == 0
    raise "We don't sell that" if menu.menu_items[item].nil

  end

  def send_confirmattion_txt(total)
    if
  end

  def check_order_price(items,  menu)
    temp_customer_order[item]  = sub_total(item, quantity, menu.menu_items[item])
    raise "The total price is not right, recalculate it" if total != total_order_amount
  end

  def customer_order
    @customer_order
  end

  def total_order_amount
    customer_order.inject(0) { |memo, value| memo + value[1][1]}
  end

  private def sub_total(item, quantity, item_price)
    qty = quantity + check_quantity(item, :quantity)
    item_total = (item_price * quantity) + check_quantity(item, :total)
    [qty, item_total]
  end

  private def check_quantity(item, options)
    if customer_order.key?(item) == false
      return 0
    else
      get_current_order_items(item, options)
    end
  end

  private def get_current_order_items(item, options)
    case options
    when :quantity
        customer_order[item][0]
    when :total
        customer_order[item][1]
    end
  end

end



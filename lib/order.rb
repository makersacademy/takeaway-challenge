require_relative 'menu'
require_relative 'customer'
include Menu
include Customer

class Order

attr_reader :basket, :select_items, :change_quantity, :basket_count, :order_value, :total_values

  def initialize
    @order = {}
    @min_order_value = 10
  end

  def select_items(item)
    Menu.items {|k,v| k.match item}
      @order.merge!(item)
  end

  def change_quantity(item)
  end

  def basket
    @order
  end

  def basket_count
    basket.count
  end

  def total_value
    basket.values.inject(0) {|sum, i| sum+i }
  end

  def insufficient_order
    @min_order_value > total_value
  end

  def submit_order
    raise "You haven't reached the minimum order value of £10, please add to your order." if insufficient_order
  else
    Customer.send_text
  end


end

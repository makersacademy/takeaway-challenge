require_relative 'restaurant'
require_relative 'takeaway'

class Order

attr_reader :new_order, :total

  def initialize
    @new_order = Hash.new(0)
  end

  def add(item, quantity)
    @new_order[item.to_sym] += quantity.to_f
    "#{quantity} #{item} added to order."
  end

  def order_sum
    @restaurant = Restaurant.new
    menu = (@restaurant.menu).keep_if { |k, v| @new_order.key? k }
    @total =  @new_order.merge(menu){|key, oldval, newval| newval * oldval}
  end

  def order_total
   order_sum.values.inject(:+)
  end

  def check_order?
    @total.values.inject(:+) == order_total
  end

  end

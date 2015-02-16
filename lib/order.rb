require_relative 'menu'
include Menu

class Order

attr_reader :basket, :select_items, :change_quantity, :basket_count, :order_value, :total_values

  def initialize
    @order = {}
    @min_order_value = 10
  end

  def basket
    @order
  end

  def basket_count
    basket.count
  end

  def select_items(item)
    Menu.items {|k,v| k.match item}
    @order.merge!(item)
  end

  # def change_quantity(item)
  #    select_items(item) * qty.to_i
  #   @order << item*qty
  # end

  def total_value
    basket.values.inject(0) {|sum, i| sum+i }
  end

  def order_insufficient
    @min_order_value > total_value
  end

  def submit_order
      raise "You haven't reached the minimum order value of £10, please add to your order." if order_insufficient
    else
      "ACTIVATE TWILIO" #function to be implemented
    end
  end


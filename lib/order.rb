require_relative 'menu'

class Order
  attr_accessor :order_list
  DEFAULT_QUANTITY = 1

  def initialize(menu = Menu.new)
    @order_list = {}
    @menu = menu
  end

  def add(item, quantity = DEFAULT_QUANTITY)
    if @order_list.include?(item)
      @order_list[item] += quantity
    else
      @order_list[item] = quantity
    end
    "#{quantity} #{item}(s) added to your order"
  end

  def total
    total_price = 0
    @order_list.each do |item, quantity|
      total_price += quantity * @menu.price(item)
    end
    "Total: £#{sprintf("%.2f", total_price)}"
  end
end

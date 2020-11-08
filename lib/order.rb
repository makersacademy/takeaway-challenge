require_relative './menu.rb'

class Order
  attr_reader :balance, :menu, :order
  def initialize(order = {}, menu = Menu.new)
    @balance = balance
    @menu = menu
    @order = order
  end

  def add_item(item, quantity = 1)
    if @order[item].nil?
      @order[item] = quantity
    else
      @order[item] += quantity
    end
  end

  def current_total
    @order.sum { |item,quantity| @menu.food[item]*quantity}
  end

  def checkout
    # Will need to do the message class to know whats next
  end
end

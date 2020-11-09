require_relative './menu.rb'
require_relative './message.rb'

class Order
  attr_reader :menu, :order
  def initialize(order = {}, menu = Menu.new)
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
    @order.sum { |item, quantity| @menu.food[item] * quantity }
  end

  def current_order
    @order.map { |item, amount| "#{item} --- Quantity; #{amount}" }.join("\n")
  end

  def checkout
    message = Message.new
    message.confirmation
  end
end

require_relative 'menu'
require_relative 'messenger'

class Order
  attr_reader :order, :menu, :message

  def initialize
    @order = {}
    @menu = Menu.new
    @message = Messenger.new
  end

  def add_to_order(item, qty)
    @order[item] = qty
  end

  def total
    total = []
    @order.each { |item, qty| total << (@menu.food[item] * qty) }
    total.inject(:+)
  end

  def expected_total(amount)
    fail 'Incorrect amount!' if amount != total
    @message.send_message
  end
end

 #order = Order.new
 #order.add_to_order("korma", 2)
 #order.expected_total (14)

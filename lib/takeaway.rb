require "./lib/order.rb"
require "./lib/message.rb"

class Takeaway

  attr_reader :new_order, :message

  def initialize
    @new_order = Order.new
  end

  def place_order
    raise "order total is not correct" unless correct_total?
    @new_order.view_summary
    @message = Message.new
    @message.send_message
  end

private

  def correct_total?
    @new_order.basket.map { |item| item[:price] }.inject(:+).round(2) == @new_order.total
  end

end

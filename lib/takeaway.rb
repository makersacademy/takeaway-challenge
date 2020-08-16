require_relative 'menu'
require_relative 'order'
require_relative 'text'
require 'time'

class Takeaway
  attr_reader :order, :time

  def initialize
    @menu = Menu.new
    @order = Order.new
    @text = Text.new
    @time = Time.new
  end

  def view_menu
    @menu.menu.each { |x| puts " #{x[:item]}: £#{x[:price]}" }
  end

  def add_item(item, quantity = 1)
    @order.add(item, quantity, @menu.price(item))
  end

  def order_total
    @order.total
  end

  def check_order
    @order.order.each { |x| puts "#{x[:quantity]} X #{x[:item]} for £#{x[:price]} each" }
  end

  def place_order
    @text.send_text("Your order will be with you by #{@time.hour + 1}:#{@time.min}. Please ensure you have £#{@order.total} in cash to pay for your order. Thank you for ordering from us.")
  end
end

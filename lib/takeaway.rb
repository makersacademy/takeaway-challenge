require_relative 'menu'
require_relative 'order'
require_relative 'text'
require 'time'

class Takeaway
  attr_reader :order, :minimum_order, :time, :text
  MINIMUM_ORDER = 10

  def initialize(min = MINIMUM_ORDER)
    @menu = Menu.new
    @order = Order.new
    @text = Text.new
    @time = Time.new
    @minimum_order = min
  end

  def view_menu
    @menu.menu.each { |x| puts " #{x[:item]}: £#{x[:price]}" }
  end

  def add_item(item, quantity = 1)
    raise 'Item is not available' unless @menu.menu.find { |x| x[:item] == item }

    @order.add(item, quantity, @menu.price(item))
  end

  def order_total
    raise "You haven't ordered anything yet" unless @order.order.count >= 1

    @order.total
  end

  def check_order
    raise "You haven't ordered anything yet" unless @order.order.count >= 1

    @order.order.each { |x| puts "#{x[:quantity]} X #{x[:item]} for £#{x[:price]} each" }
  end

  def place_order
    raise "£#{@minimum_order} minimum order requirement, currently £#{@order.total}" unless @order.total >= @minimum_order

    @text.send_text("Your order will be with you by #{@time.hour + 1}:#{@time.min}. Please ensure you have £#{@order.total} in cash to pay for your order. Thank you for ordering from us.")
  end
end

require_relative 'menu'
require_relative 'sms'

class Order
  attr_accessor :order_array, :menu
  ORDER_MIN = 1

  def initialize
    @order_array = []
    @menu = Menu.new
    @sms = Sms.new
  end

  def add_to_order(item, quantity = ORDER_MIN)
    raise "That is not on the menu!" unless item_exists?(item)

    quantity.times { @order_array << { item => @menu.price(item) } }
    "You added #{item} to your order and it cost you £#{@menu.price(item)}!"
  end

  def item_exists?(item)
    @menu.menu.include?(item)
  end

  def view_order
    @order_array.each do |items|
      items.each { |item, price| puts "#{item}: £#{price}" }
    end
  end

  def total
    price_array = []
    @order_array.each do |items|
      items.each { |_item, price| price_array << price }
    end
    puts "Your order comes to a total of £#{price_array.sum}"
  end

  def checkout
    @sms.order_confirmation
  end
end

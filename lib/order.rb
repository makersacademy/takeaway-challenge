require_relative 'menu'

class Order

  attr_reader :menu, :order_items, :order_sum

  def initialize(menu = Menu.new)
    @menu = menu
    @order_items = []
    @order_sum = 0
  end

  def read_menu
    self.menu.display
    puts "When ordering you need to give name of the dish and the amount you wish"
  end

  def add_to_order(item_number)
    @order_items << self.menu.menu_items[item_number - 1]
  end

  def display_order
    puts "Your order has the following items: "
    @order_items
  end

  def order_sum
    item_prices = @order_items.map{|item| item[:price]}
    order_sum = item_prices.inject(@order_sum) {|sum, item| sum + item}
    order_sum
  end

  def is_correct_amount?(price)
    message = puts "Your order is ready to be delivered"
    return message if order_sum.round(2) == price
  end

end

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
    @order_items << self.menu.display[item_number - 1]
  end

  def display_order
    puts "Your order has the following items: "
    @order_items
  end

  def order_sum
    item_prices = @order_items.map{|x| x[:price]}
    item_prices.inject(@order_sum) {|sum, x| sum + x}
  end

  def correct_total?
  end

end

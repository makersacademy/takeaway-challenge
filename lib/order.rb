require_relative 'menu'

class Order

  attr_reader :menu, :order_items, :order_sum

  def initialize(menu_klass)
    @menu = menu_klass.new
    @order_items = []
    @order_sum = 0
  end

  def read_menu
    self.menu.display
    puts "When ordering you need to give name of the dish and the amount you wish"
  end

  def add_to_order(item_number)
    self.order_items << self.menu.menu_items[item_number - 1]
  end

  def display_order
    puts "Your order has the following items: "
    self.order_items.each do |item|
      puts "#{item[:num]}. #{item[:dish]}" + "...£#{item[:price]}"
    end
  end

  def order_sum
    item_prices = self.order_items.map{|item| item[:price]}
    order_sum = item_prices.inject(@order_sum) {|sum, item| sum + item}
    order_sum.round(2)
  end

  def is_correct_amount?(price)
    return true if order_sum.round(2) == price
  end
end

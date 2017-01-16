require_relative 'menu'

class Order

  attr_reader :menu, :order_items, :order_sum

  def initialize(menu_session)
    @menu = menu_session.new
    @order_items = []
    @order_sum = 0
  end

  def read_menu
    self.menu.view # couldn't figure out why this was failing in the spec file expect(order.read_menu).to eq menu.view
    puts ""
    puts "*When ordering, please provide the name and amount of the dish being ordered"
  end

  def add_dish(dish_number)
    self.order_items << self.menu.menu_items[dish_number - 1]
  end

  def order_sum
    dish_prices = self.order_items.map{ |item| item[:price] }
    order_total = dish_prices.inject(@order_sum) { |sum, item| sum + item }
    '%.02f' % order_total
  end

  def double_check(total_price)
    return true if order_sum == total_price
  end

  def view_order
    if @order_items.size == 0
      @order_items = '0.00'
    else
      puts "Your order includes the following: "
      self.order_items.each do |item|
        puts "#{item[:no]}. #{item[:dish]}" + "...EUR #{item[:price]}"
      end
    end
  end
end

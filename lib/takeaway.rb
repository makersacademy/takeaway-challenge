require_relative 'menu'

class Takeaway

  attr_reader :menu, :customer_order

  def initialize
    @menu = Menu.new
    @customer_order = Order.new
  end

  def show_menu
    @menu.dishes.each do |dish|
      puts "#{dish.name}, £#{dish.price}"
    end
  end

  def check_total
    @customer_order.calculate_total
    "Your order will cost £#{customer_order.total_bill}"
  end

end

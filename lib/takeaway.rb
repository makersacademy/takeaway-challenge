require_relative 'menu'
require_relative 'dish'
require_relative 'order'

class Takeaway
  attr_accessor :menu
  attr_reader :orders
  LINE_WIDTH = 50

  def initialize(menu_class: Menu, order_class: Order)
    @menu = menu_class.new
    @orders = [order_class.new]
  end

  def show_menu
    print_menu_title
    @menu.dish_list.each { |dish| print_menu_line(dish.name, dish.price) }
  end

  def order(name, quantity = 1)
    @menu.dish_list.each do |dish|
      @orders[0].add(dish, quantity) if dish.name == name.to_sym
    end
  end

  def checkout
    print_title
    @orders[0].cart.each { |k, val| print_line(k.name, k.price * val, val) }
    print_total
  end

  def pay(sum)
    message = 'Amount entered differ from total'
    raise RuntimeError, message unless sum == orders[0].total
    puts 'Thank you! Your order was placed and will be delivered before 18:52'
    @orders.unshift(Order.new)
  end

  private

  def print_total
    puts "--------------------"
    puts "Total: #{@orders[0].total}".ljust(LINE_WIDTH)
  end

  def print_menu_line(name, price)
    puts "#{name}..........#{price}".ljust(LINE_WIDTH)
  end

  def print_menu_title
    str = "- MENU -\n"
    puts str.center(LINE_WIDTH)
  end

  def print_title
    str = "- CHECKOUT -\n"
    puts str.center(LINE_WIDTH)
  end

  def print_line(name, price, quantity)
    puts "#{name} x #{quantity}..........#{price}".ljust(LINE_WIDTH)
  end
end

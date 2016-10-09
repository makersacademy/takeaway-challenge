require_relative 'restaurant'
require_relative 'menu'


class Takeaway

  attr_reader :menu, :order, :current_order

  def initialize
    @current_order = []
    @menu = Menu.new
  end

  def add_to_current_order(num)
    @current_order << @menu.menu_list[num - 1]
  end

  def pretty_print_order
    count = 1
    puts "Your order is:"
      @current_order.each do |item|
        puts "#{count} #{item[:name]} - £#{item[:price]}"
        count += 1
      end
  end

  def clears_current_order
    @current_order = []
  end

end

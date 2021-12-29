require_relative 'menu'
require_relative 'order'

class Takeaway
  attr_reader :menu, :order

  def initialize(menu)
    @menu = menu
    @order = Order.new(menu)
  end

  def display_menu
    puts @menu.print_menu
  end

  def build_order(item, quantity)
    @order.add_item(item, quantity)
    @order.basket
  end
  
  def display_order
    @order.basket.map do |item, quantity|
      puts "* #{quantity} x #{item} .. £#{sprintf('%.2f', calculate_quantity_total(item))}"
    end
    display_total
  end

  private

  def calculate_quantity_total(item)
    @menu.items[item] * @order.basket[item]
  end

  def display_total
    puts "* Total ..... £#{sprintf('%.2f', @order.calculate_total)}"
  end

end

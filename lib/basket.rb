#understands how to hold chosen items
require_relative "main"
require_relative "italian"

class Basket

  attr_reader :current_basket

  def initialize
    @current_basket = {}
  end

  def add_to_cart(item)
    load_menu
    fail "Item not on menu" if !@menu.has_key?(item.to_sym)
    @current_basket[item.to_sym] = @menu[item.to_sym]
  end

  def basket_status
    @current_basket.each do |item, price|
      puts "#{item}: £#{price}"
    end
    puts "Total: £#{basket_total}"
  end

  private

  def basket_total
    @total = 0.00
    @current_basket.each do |item,price|
      @total += price
    end
    "%.2f" % @total
  end

  def load_menu
    @menu = Italian.new.menu
  end

end

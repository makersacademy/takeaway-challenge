require_relative 'menu'

class Order
  attr_reader :current_order, :menu, :total

  def initialize
    @menu = Menu.new
    @current_order = []
    @total = 0
  end

  def add(item)
    raise "#{item} is not on the menu" unless menu.item?(item)
    @current_order << item
    calculate_total(item)
  end

  def show_total
    puts "Order Total: £#{format("%.2f", total)}"
  end

  private

  def calculate_total(item)
    @total += menu.price(item)
  end

end

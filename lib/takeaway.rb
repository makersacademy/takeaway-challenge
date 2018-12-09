require_relative 'menu_display'
require_relative 'order'

class Takeaway

  attr_reader :menu

  def initialize(menu = Menu.new, order = Order.new)
    @menu = menu
    @order = order
  end

  def show_menu
    @menu.show
  end

  def order
    puts "Please enter your order"
    input = Kernel.gets.chomp
    @order.add(input)
  end
end

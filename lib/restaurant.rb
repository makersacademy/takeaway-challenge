
class Restaurant
  require_relative 'menu' 
  require_relative 'order'

  attr_reader :menu, :order

  def initialize(menu = Menu.new, order = Order.new)
    @menu = menu
    @order = order
  end

  def show_menu
    menu.print_menu
  end

  def ask_order
    p "Please enter your order"
    input = gets.chomp
    @order.add(input)
  end

  def show_summary
    order.summary
  end

end

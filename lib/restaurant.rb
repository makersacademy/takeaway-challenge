
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

  def order
    p "Please enter your order"
    item = gets.chomp
    @order.add(item)
  end

end
require_relative 'order'
require_relative 'menu'

class Order
  attr_reader :menu, :current_order, :quantity

  def initialize(menu = Menu.new)
    @menu = menu
    @current_order = []
    @quantity = []
  end

  def place_order
    @menu.print_dishes
  end

  def take_order
    puts('What would to like to order?')
    puts('Enter the number of the dish you would like to order')
    @current_order << $stdin.gets.to_i
    puts('Enter the quantity')
    @quantity << $stdin.gets.to_i
  end

  def order_confirmation
    true
  end
end

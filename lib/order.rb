require_relative 'order'
require_relative 'menu'

class Order
  attr_reader :menu, :dish_num, :quantity, :current_order

  def initialize(menu = Menu.new)
    @menu = menu
    @dishes = @menu.menu_items
    @dish_num  = []
    @quantity = []
    @current_order = []
  end

  def print_menu
    @menu.print_dishes
  end

  def take_order
    puts('Enter the number of the dish you would like to order')
    @dish_num << $stdin.gets.to_i
    puts('Enter the quantity')
    @quantity << $stdin.gets.to_i
  end

  def order_confirmation()
     @dish_num.each do |dish_num|
        @quantity.each{|num| num.times {@current_order << @dishes[dish_num -1]}}
    end
    @current_order
  end

end

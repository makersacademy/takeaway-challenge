require_relative 'menu'

class Order

  attr_reader :menu

  def initialize
    @menu = Menu.new
    @order = []
  end

  def read_menu
    @menu.create_menu
    @menu.display
    puts "When ordering you need to give the number of the dish and the amount you wish"
  end

  def order(dish_number, amount)
    # @order << 
  end

  def total
  end

end

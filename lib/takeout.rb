require_relative 'takeout_menu'

class Takeout
  attr_reader :order
  
  def initialize
    @takeout_menu = TakeoutMenu.new
    @order = []
  end

  def show_menu
    @takeout_menu.menu_list
  end

  def add_order(food, quantity)
    raise "That is not on the menu!" unless @takeout_menu.menu.include?(food)

    quantity.times do
      @order << food
    end
  end

end

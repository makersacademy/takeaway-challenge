require_relative 'takeout_menu'

class Takeout
  attr_reader :order, :total

  def initialize
    @takeout_menu = TakeoutMenu.new
    @order = []
    @total = 0
  end

  def show_menu
    @takeout_menu.menu_list
  end

  def add_order(food, quantity, price)
    raise "That is not on the menu!" unless @takeout_menu.menu.include?(food)
    @total += price
    quantity.times do
      @order << food
    end
  end

end

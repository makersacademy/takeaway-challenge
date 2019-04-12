require_relative 'takeout_menu'

class Takeout
  attr_reader :order, :total_given

  def initialize
    @takeout_menu = TakeoutMenu.new
    @order = []
    @total_given = 0
  end

  def show_menu
    @takeout_menu.menu_list
  end

  def add_order(food, quantity, price)
    raise "That is not on the menu!" unless @takeout_menu.menu.include?(food)

    @total_given += price
    quantity.times do
      @order << food
    end
  end

  def finish_order
    price = Price.new
    price.food_conversion(@order)
  end
end

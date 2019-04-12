require_relative 'menu'

class Takeout
  attr_reader :order, :total_given

  def initialize
    @menu = Menu.new
    @order = []
    @total_given = 0
  end

  def show_menu
    @menu.menu_display
  end

  def add_order(food, quantity, price)
    raise "That is not on the menu!" unless @menu.menu_list.include?(food)

    @total_given += price
    quantity.times do
      @order << food
    end
  end

  def finish_order
    price = Price.new
    true_total = price.food_conversion(@order)
    raise "Total given does not match true total." if true_total != @total_given
    true_total
  end
end

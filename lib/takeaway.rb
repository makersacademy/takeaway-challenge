require_relative 'menu'

class TakeAway
  attr_reader :customer_order

  def initialize(menu = Menu.new)
    @menu = menu
    @customer_order = []
  end

  def print_menu
    @menu.print
  end

  def select_dish(dish)
    # an array of names
    @customer_order << dish
  end

  def total
    @customer_order.each { |item| @menu.dish_price(item) }.inject(:+)
  end
end

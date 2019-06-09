require_relative 'order'

class Pierogi

  attr_reader :menu

  def initialize
    @menu = {}
  end

  def add_menu(dish, price)
    raise "Price must be a number" unless price.is_a?(Integer)
    @menu[dish] = price
    nil
  end

  def show_food
    @menu
  end

end
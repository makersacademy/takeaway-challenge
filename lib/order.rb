require './lib/menu.rb'

class Order

  attr_accessor :contents, :total, :menu

  def initialize
    @contents = []
    @total = 0
    @menu = Menu::MEALS
  end

  def add_dish(dish, quantity = 1)
    raise 'That dish is not on the menu' unless dish_available?(dish)

    quantity.times { @contents << dish }
    quantity.times { @total += @menu[dish] }
  end

  def dish_available?(dish)
    @menu.has_key?(dish)
  end

  def check_order_total
    possible_total = 0
    @contents.map { |dish| possible_total += @menu[dish] }
    possible_total == @total
  end

end

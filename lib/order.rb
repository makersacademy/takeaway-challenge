require_relative 'menu'

class Order
  attr_reader :total_price

  def initialize(menu)
    @total_price = 0
    @menu = menu
  end

  def add_to_basket(dish_name)
    @total_price += @menu.select_dish(dish_name).price
  end

end

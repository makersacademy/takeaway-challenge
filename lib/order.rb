require_relative 'menu'

class Order
  attr_reader :total_price

  def initialize(menu)
    @total_price = 0
    @menu = menu
  end

  def add_to_basket(dish_name, quantity = 1)
    @total_price += quantity * item_price(dish_name)
  end

  private

  def item_price(dish_name)
    @menu.select_dish(dish_name).price
  end

end

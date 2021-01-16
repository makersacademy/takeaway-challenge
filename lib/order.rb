require_relative 'menu'

class Order
  attr_reader :total_price

  def initialize(menu)
    @total_price = 0
    @menu = menu
  end

  def add_to_basket(dish_name, quantity = 1)
    positive_int_check(quantity)
    @total_price += item_price(dish_name, quantity)
  end

  private

  def item_price(dish_name, quantity)
    @menu.select_dish(dish_name).price * quantity
  end

  def positive_int_check(quantity)
    positive_int = quantity.to_int == quantity && quantity.positive?
    raise 'Quantity must be a positive integer' unless positive_int
  end
end

require_relative 'dish.rb'
require_relative 'price_calculator.rb'

class Menu
  attr_reader :price_list, :selected_dishes
  def initialize(price_calculator_class: Price_calculator)
    @dishes = []
    @price_list = {}
    @selected_dishes = {}
  end

  def price_list
    @price_list.dup
  end

  def add_dishes(*dishes)
    dishes.each {|dish| @dishes << dish}
  end

  def view_prices
    @dishes.each {|dish| @price_list[dish.name] = dish.price}
    price_list
  end

  def select_dish(dish,quantity = 1)
    dish.set_selected
    selected_dishes[dish] = quantity
  end
end

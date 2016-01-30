require_relative 'dish.rb'
require_relative 'price_calculator.rb'

class Menu
  attr_reader :dishes, :price_list
  def initialize(price_calculator_class: Price_calculator)
    @dishes = []
    @price_list = Hash.new
  end

  def view_prices
    dishes.each {|dish| price_list[dish.name] = dish.price}
    price_list
  end
end

require 'byebug'
require_relative 'dish'

class Menu

  attr_reader :items

  def initialize(dish_class: Dish)
    @items = Array.new
    @dish = dish_class
  end

  def add_item(name, price, available)
    @items << @dish.new(name, price, available)
  end

  def build_menu
    @current_menu = []
    @current_menu = @items.select { |dish| dish.available }
  end

  def todays_menu
    @current_menu.join("\n")
  end
end

# TO DO
# add items.dup
# make build_menu private, re-write the test
# research private versus public methods ruby

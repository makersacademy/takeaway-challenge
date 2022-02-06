require 'csv'
require_relative './dish.rb'

class DishesList
  attr_reader :dishes

  def initialize
    @dishes = []
  end

  def add_dish(dish)
    @dishes << dish
  end

  def dishes_available
    dishes_available = []
    @dishes.each do |dish|
      if dish.available?
        dishes_available << dish
      end
    end
    dishes_available
  end

  def load_menu(filename = "dishes_file.csv")
    # open the file
    if File.exists?(filename)
      dishes_file = CSV.read(filename)
      identifier = 1
      dishes_file.each do |line|
        name, quantity, price = line
        add_dish(Dish.new(identifier, name, quantity.to_i, price))
        identifier += 1
      end
    else
      raise "#{filename} does not exist."
    end
  end
end

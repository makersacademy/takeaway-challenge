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

  def display_dishes
    return_dishes = ""
    dishes_available.each do |dish|
      return_dishes += dish.details + "\n"
    end
    return_dishes
  end

  def return_dish(number)
    return_dish = nil
    dishes_available.each do |dish|
      return_dish = dish if dish.identifier == number
    end
    return_dish
  end

  def calculate_total(dishes)
    running_total = 0
    dishes.each do |dish|
      running_total += dish.price.to_f
    end
    running_total
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

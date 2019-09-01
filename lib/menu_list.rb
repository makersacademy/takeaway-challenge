require 'csv'
require_relative './dish.rb'

class MenuList
  attr_reader :dishes

  def initialize
    @dishes = []
  end

  def add_item(dish)
    @dishes << dish
  end

  def available_dishes
    available_dishes = []
    @dishes.each do |dish|
      if dish.available?
        available_dishes << dish
      end
    end
    available_dishes
  end

  def display_menu
    return_menu = ""
    available_dishes.each do |dish|
      return_menu += dish.describe + "\n"
    end
    return_menu
  end

  def return_dish(number)
    return_dish = nil
    available_dishes.each do |dish|
      return_dish = dish if dish.identifier == number
    end
    return_dish
  end

  def calculate_total(dishes)
    running_total = 0
    dishes.each do |dish|
      running_total += dish.cost.to_f
    end
    running_total
  end

  def load_menu(filename = "menu_file.csv")
    raise "#{filename} doesn't exist." unless File.exist?(filename)
    menu_file = CSV.read(filename)
    identifier_count = 1
    menu_file.each do |line|
      description, qty, cost = line

      add_item(Dish.new(identifier_count,
        description,
        qty.to_i,
        cost))

      identifier_count += 1
    end
  end
end

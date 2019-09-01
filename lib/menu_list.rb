require 'csv'
require_relative './dish.rb'

class MenuList
  attr_reader :dishes

  def initialize
    @dishes = []
  end

  def add_item(identifier, dish)
    @dishes << { id: identifier, dish: dish }
  end

  def available_dishes
    available_dishes = []
    @dishes.each do |dish_hash|
      if dish_hash[:dish].available?
        available_dishes << dish_hash
      end
    end
    available_dishes
  end

  def display_menu
    display_menu = ""
    available_dishes.each do |dish_hash|
      display_menu += dish_hash[:dish].describe + "\n"
    end
    display_menu
  end

  def load_menu(filename = "menu_file.csv")
    raise "#{filename} doesn't exist." unless File.exist?(filename)
    menu_file = CSV.read(filename)
    identifier_count = 1
    menu_file.each do |line|
      description, qty, cost = line

      add_item(identifier_count,
        Dish.new(identifier_count,
        description,
        qty.to_i,
        cost))

      identifier_count += 1
    end
  end
end

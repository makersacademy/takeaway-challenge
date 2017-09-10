require_relative 'dish'
require 'csv'

class Menu

  attr_reader :menu, :dish_class, :file

  def initialize(dish_class = Dish)
    @dish_class = dish_class
    @menu = []
    create_menu
  end

  def create_menu(file = "./lib/menu.csv")
    CSV.foreach(file, converters: :numeric) do |row|
      new_dish = @dish_class.new(row[0], row[1])
      @menu << new_dish
    end
  end

  def display_menu(menu = @menu)
    menu.each_with_index do |dish, index|
      dish_name = dish.name
      dish_price = dish.price
      p "#{index}. #{dish_name} => £#{dish_price}"
    end
  end
end

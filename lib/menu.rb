require 'csv'

class Menu
  attr_reader :dishes, :menu

  def initialize
    @dishes = []
  end

  def load_menu menu_items
    @menu = File.open("menu_items.csv", "r") do |f|
      CSV.foreach(f) do |line|
        dish, price = line[0], line[1]
        add_dish(dish, price)
      end
    end
  end

  def add_dish dish, price
    @dishes << { dish: dish, price: price }
  end
end

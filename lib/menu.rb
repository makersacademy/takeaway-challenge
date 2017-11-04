require 'csv'

class Menu
  attr_reader :dishes, :menu

  def initialize
    @dishes = []
  end

  def print_menu
    load_menu
    @dishes.each do |item|
      puts "#{@dishes.index(item) + 1}. #{item.fetch(:dish)}, £#{'%.2f' % item.fetch(:price).to_f}"
    end
  end

  private

  def add_dish dish, price
    @dishes << { dish: dish, price: price }
  end

  def load_menu
    @menu = File.open("menu_items.csv", "r") do |f|
      CSV.foreach(f) do |line|
        dish, price = line[0], line[1]
        add_dish(dish, price)
      end
    end
  end
end

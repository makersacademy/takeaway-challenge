require_relative 'dish'
require 'csv'

class Menu

  def initialize(dish_class)
    @dishes = []
    @dish_class = dish_class
    load_dishes
  end

  def print_menu
    @dishes.map.with_index {|dish,index| "#{index +1}. #{print_dish(dish)}"}
  end

  def dishes
    @dishes
  end

  def print_dish(dish)
    "#{dish.name}: £#{dish.price}"
  end

  private

  def load_dishes
    CSV.foreach(File.path(File.dirname(Dir.pwd) + '/takeaway-challenge/assets/menu.csv')) do |row|
      @dishes.add(dish_class.new(name: row[0], price: row[1]))
    end
  end

  def add(item)
    @dishes << item
  end

end

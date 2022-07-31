require 'csv'
require_relative '../lib/dish'

class Menu

  def initialize(dish_class = Dish)
    @dish_class = dish_class
  end

  def show_menu 
    format_menu
  end

  def select_dish(search_name)
    @menu.find { |dish| dish.name == search_name }
  end

  def load_menu(filename = './data/menu.csv')
    @menu = []
    CSV.parse(File.read(filename)) do |row|
      name, price = row
      @menu << @dish_class.new(name, price)
    end
  end

  private

  def format_menu
    # I would like to revist this and make a money class with pounds and pence.(just found there is a Money Gem!")
    # for the purpose of this exercise and time available I will leave this as it is
    @menu.map { |dish| "#{dish.name}, Price: £#{'%.2f' % dish.price}" }.join("\n")
  end

end

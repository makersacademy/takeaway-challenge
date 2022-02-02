#require 'dish' 
require 'csv'

class Menu

  # I am using intermezzo: Of Classes here and injecting the class Dish into class Menu
  def initialize(dishes, dish = Dish)
    @dish = dish
    @menu = []
    build_menu(dishes)
  end

  def show_menu 
    format_menu
  end

  def select_dish(search_name)
    @menu.find { |dish| dish.name == search_name }
  end

  private
  
  def format_menu
    # I would like to revist this and make a money class with pounds and pence.
    # for the purpose of this exercise and time available I will leave this as it is
    @menu.map { |dish| "#{dish.name}, Price: £#{'%.2f' % dish.price}" }.join("\n")
  end

  def build_menu(dishes)
    CSV.parse(dishes) do |row|
      name, price = row
      @menu << @dish.new(name, price)
    end
  end
end

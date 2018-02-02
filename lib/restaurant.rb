require_relative 'dish'

class Restaurant

  attr_reader :menu

  def initialize
    @menu = []
  end

  def create_dish(name, price)
    dish = Dish.new(name, price)
    @menu << dish
  end

  def display_menu
    @menu.each_with_index { |dish, index|
    puts "#{index+1}. #{dish.name} | #{dish.price} pounds  \n"
  }
  end

end

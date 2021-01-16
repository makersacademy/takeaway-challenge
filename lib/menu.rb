require_relative "dish"

class Menu

  attr_reader :dishes_list

  def initialize
    @dishes_list = []
  end


  def add_dish(dish)
    @dishes_list << dish
  end

  def print_dishes
    dishes_list.each_with_index do |dish, index|
      puts "#{index + 1}. #{dish.name} £#{dish.price}"
    end
  end

end
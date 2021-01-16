require_relative "dish"

class Menu

  attr_reader :dishes_list, :selected_dishes

  def initialize
    @dishes_list = []
    @selected_dishes = []
  end


  def add_dish(dish)
    @dishes_list << dish
  end

  def print_dishes
    dishes_list.each_with_index do |dish, index|
      puts "#{index + 1}. #{dish.name.ljust(20, ".")} £#{sprintf("%.2f", dish.price)}"
    end
  end

  def choose_dishes
    @selected_dishes << "dishes"
  end

end
require_relative './dish'
# Creates a menu with a list of dishes.

class Menu
  attr_reader :dishes

  def initialize
    @dishes = []
  end

  def add_dish(dish)
    @dishes << dish
  end

  def list_dishes
    puts "MENU"
    print_sorted_dishes
  end

  private

  def print_sorted_dishes
    @dishes.each do |dish|
      puts "#{dish.name}, £#{dish.price}"
    end
  end
end

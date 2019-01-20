require_relative 'dish'
require_relative 'print'

class Menu

  attr_reader :list

  def initialize(print = Print)
    @list = []
    @print = print.new
  end

  def add_dish(dish)
    @list << dish
  end

  def print_menu
    puts @print.print_menu(@list)
  end

end

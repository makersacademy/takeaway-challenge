require 'menu'
require 'read'

class Ui
  attr_reader :menu, :read

  def initialize(menu = Menu.new([]), read = Read.new)
    @menu = menu
    @read = read
  end

  def display
    puts menu.display_dishes
  end

  def select_dish
    puts "Select Dish (number)"
    @read.get_read.to_i
  end
end

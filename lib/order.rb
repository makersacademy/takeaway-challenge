require_relative 'menu.rb'

class Order

  attr_reader :selection
  attr_reader :dishes
  attr_reader :total

  def initialize
    @selection = []
    @dishes = Menu.new.dishes
    @total = 0
  end

  def view_menu
    Menu.new
  end

  def add(dish_index)
    @selection << @dishes[dish_index -1]
    @total += @dishes[dish_index -1][:price]
  end
end

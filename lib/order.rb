require_relative 'menu.rb'

class Order

  attr_reader :selection, :dishes, :total

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
    @selected_dish = @dishes[dish_index -1][:smoothie]
    confirmation
  end

  def confirmation
    "You successfully added #{@selected_dish} to your basket"
  end
end

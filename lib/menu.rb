require_relative './dish.rb'

class Menu

  def initialize
    @dishes = {
      :pizza => Dish.new("Pizza", 6.50),
      :spaghetti => Dish.new("Spaghetti", 5.75),
      :salad => Dish.new("Salad", 5.25)
    }
  end

  def dishes
    @dishes.dup
  end

  def view
    view_dish_list = []
    @dishes.each do |key, dish|
      view_dish_list << dish.display
    end
    view_dish_list.join("\n")
  end

  def select(choice)
    @dishes[choice]
  end

end

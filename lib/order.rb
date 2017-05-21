require 'menu'

class Order

  attr_reader :menu, :meal

  def initialize(menu)
    @menu = menu
    @meal = []
  end

  def select_dish(selection)
    if selection.respond_to?(:even?)
      select_dish_by_number(selection)
    else
      select_dish_by_name(selection)
    end
  end
private

  def select_dish_by_number(selection)
    @meal << @menu.dishes[selection - 1]
  end

  def select_dish_by_name(selection)
    @menu.dishes.each do
      |dish| @meal << dish if dish.name.downcase == selection.downcase
    end
  end
end

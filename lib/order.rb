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
    fail error_not_on_menu_message if can_not_find_number_in_menu?(selection)
    @meal << @menu.dishes[selection - 1]
  end

  def select_dish_by_name(selection)
    fail error_not_on_menu_message unless can_find_name_in_menu?(selection)
    @menu.dishes.each do
      |dish| @meal << dish if dish.name.downcase == selection.downcase
    end
  end

  def can_find_name_in_menu?(selection)
    @menu.dishes.any? { |dish| dish.name.downcase == selection.downcase}
  end

  def can_not_find_number_in_menu?(selection)
    @menu.dishes[selection -1].nil?
  end

  def error_not_on_menu_message
    "Sorry, that's not an item on the menu, please try again"
  end
end

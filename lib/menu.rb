require_relative 'dishes_list'

class DishesMenu

attr_reader :list_of_dishes

  def initialize(dish_list = DishList::DISHES)
    @list_of_dishes = dish_list
  end

  def format_list
    formatted = "LIST OF AVAILABLE DISHES:".center(60) + "\n\n"
    n = 1
    list_of_dishes.each do |dish|
          formatted += "#{n}. #{dish[:dish]}".ljust(50) + "£#{dish[:price]}".rjust(10) + "\n"
      n += 1
    end
    formatted += "\n"
  end
end

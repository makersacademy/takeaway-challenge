require_relative 'dishes_list'

class DishesMenu

attr_reader :list_of_dishes
LINE_WIDTH = 60

  def initialize(dish_list)
    @list_of_dishes = dish_list
  end

  def format_list
    formatted = "LIST OF AVAILABLE DISHES:".center(LINE_WIDTH) + "\n\n"
    n = 1
    list_of_dishes.each do |dish|
          formatted += "#{n}. #{dish[:dish]}".ljust(LINE_WIDTH/2) + "£#{dish[:price]}".rjust(LINE_WIDTH/2) + "\n"
      n += 1
    end
    formatted += "\n"
  end

  def show_dishes
    print format_list
  end

end

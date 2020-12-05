require './lib/dish.rb'

class Menu

  attr_reader :dishes

  def initialize
    @dishes = []
  end

  def add_dish(dish)
    @dishes << dish
  end

  def see_menu
    # @dishes[0].price
    menu_text = ""
    @dishes.each{ |dish|
    menu_text << "#{dish.name}, #{dish.price}\n"
    }
    puts menu_text
  end

end

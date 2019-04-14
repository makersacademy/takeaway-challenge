require_relative 'no_item_error'

class Selection
  
  attr_reader :dishes

  def initialize(menu)
    @dishes = {}
    @menu = menu 
  end


  def add(dish, number_of_dish)
    fail NoItemError, "#{dish.capitalize} are not on the menu, you pig." unless menu.has_dish?(dish)
    dishes[dish] = number_of_dish
  end

<<<<<<< HEAD
  def total
    dish_total.inject(:+)
=======
  def has_dish?

>>>>>>> 3e3a9aa6a5ad2fbd5599a0587e75847e5c2151e5
  end

  private 

  attr_reader :menu
<<<<<<< HEAD

  def dish_total 
    dishes.map { | dish, number_of_dish |
    menu.price(dish) * number_of_dish
    }
  end

=======
>>>>>>> 3e3a9aa6a5ad2fbd5599a0587e75847e5c2151e5
end



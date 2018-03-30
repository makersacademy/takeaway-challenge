require_relative './dish'

class Menu

  SET_MENU = 3

  def initialize(menu = {
    pizza: => []
    paste: => []
    side: => []
    salade: => []
  })
    @menu = menu
  end

  def menu_generator
    SET_MENUE.times {
      @menu[:pizza] << Dish.rand_pizza_dish
      @menu[:paste] << Dish.rand_paste_dish
      @menu[:side] << Dish.rand_side_dish
      @menu[:salade] << Dish.rand_salade_dish
    }
    return @menu
  end

  def print_menu
    print "Menue PizzaVolf".center(25,"*")
    print "Pizza: #{@menu[:pizza]}".center(25)
    print "Paste: #{@menu[:paste]}".center(25)
    print "Side: #{@menu[:side]}".center(25)
    print "Salade: #{@menu[:salade]}".center(25)
    print "end".center(25, "*")
  end
end

class TakeawayApp

  attr_reader :menu_selection

  def initialize(restaurant)
    @restaurant = restaurant
    @menu_selection = []
  end

  def restaurant_menu
    @restaurant.menu
  end

  def menu(selection, qty, total)
    @menu_selection << [selection, qty, total]
  end
 end

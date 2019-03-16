require_relative 'takeaway_menu'
require_relative 'basket'

class TakeAway

  def initialize(
    menu_class = TakeAwayMenu, menu = menu_class.new, basket = Basket.new(menu)
  )
    @menu = menu
    @basket = basket
  end

  def read_menu
    @menu.read
  end

  def add_to_basket(dish)
    @basket.add(dish)
    "#{dish} added to basket"
  end

  def view_basket
    @basket.view
  end

end

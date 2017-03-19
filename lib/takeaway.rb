require './lib/menu.rb'
require './lib/order.rb'

class Takeaway

  attr_reader :menu, :basket

  def initialize(menu = Menu.new, basket = nil)
    @menu   = menu
    @basket = basket
  end

  # ------------------------------- USER INTERFACE -------------------------------

  def see_menu(menu = @menu)
    menu.see_dishes
  end

  def select_dishes(*dishes, expected_total)
    @basket = Order.new
    @basket.assign_dishes(dishes)
    basket.check_quantity(expected_total)
  end

  def view_order(basket = @basket)
    basket.see_order
  end

  def place_order(basket = @basket)
    basket.confirm_order
    @basket = nil
  end

  # ------------------------------- USER INTERFACE -------------------------------

end

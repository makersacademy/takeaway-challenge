require './lib/menu.rb'
require './lib/order.rb'

class Takeaway

  attr_reader :basket

  def initialize
    @menu = Menu.new
    @basket = nil
  end

  # ------------------------------- USER INTERFACE -------------------------------

  def see_menu
    menu.see_dishes
  end

  def select_dishes(*dishes, expected_total)
    @basket = Order.new
    @basket.assign_dishes(dishes)
    basket.check_quantity(expected_total)
  end

  def view_order
    basket.see_order
  end

  def place_order
    basket.confirm_order
    @basket = nil
  end

  # ------------------------------- USER INTERFACE -------------------------------

  private

  attr_reader :menu

end

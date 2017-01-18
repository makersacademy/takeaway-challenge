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
    fail error_message(basket, expected_total) if !basket.quantity_correct?(expected_total)
  end

  def place_order
    basket.confirm_order
    @basket = nil
  end

  # ------------------------------- USER INTERFACE -------------------------------

  private

  attr_reader :menu

  def error_message(basket, expected_total)
    "You've entered #{basket.order_quantity} dishes rather than the #{expected_total} that you expected!"
  end

end

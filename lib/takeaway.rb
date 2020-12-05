require_relative 'menu'

class Takeaway

  attr_reader :current_order

  def initialize(menu = Menu)
    @menu = menu.new
    @current_order = []
  end

  def add_to_order(dish)
    @current_order << dish
  end

  def place_order(order, given_total)
    fail "Total incorrect!" unless @menu.check_total(order, given_total)
    reset_current_order
    order_confirmation
  end

  private

  def order_confirmation
    "Thank you! Your order was placed and will be delivered before 18:52"
  end

  def reset_current_order
    @current_order = []
  end

end
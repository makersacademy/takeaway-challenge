require_relative 'menu'

class Takeaway

  def initialize(menu = Menu)
    @menu = menu.new
  end

  def place_order(order, given_total)
    fail "Total incorrect!" unless @menu.check_total(order, given_total)
    order_confirmation
  end

  def order_confirmation
    "Thank you! Your order was placed and will be delivered before 18:52"
  end

end
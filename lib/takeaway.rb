require_relative 'menu'

class Takeaway

  attr_reader :current_order

  def initialize(menu = Menu)
    @menu = menu.new
    @current_order = []
  end

  def add_to_order(dish)
    @current_order << dish_finder(dish)
  end

  def place_order(given_total)
    fail "Total incorrect!" unless @menu.check_total(@current_order, given_total)
    reset_current_order
    order_confirmation
  end

  def add_dish(name, price)
    @menu.add_dish(name, price)
  end

  private

  def order_confirmation
    "Thank you! Your order was placed and will be delivered before #{Time.now + 60*60}"
  end

  def reset_current_order
    @current_order = []
  end

  def dish_finder(dish)
    @menu.dishes.find { |x| x.details[:name] == dish }
  end

end
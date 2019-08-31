class Takeaway

  attr_reader :menu

  CURRENT_MENU = { "burger" => "£2", "chips" => "£1", "kebab" => "3" }

  def initialize
    @menu = CURRENT_MENU
    @current_order = Order.new
  end

  def add_to_order(dish, quantity)
    @current_order.add(dish, quantity)
  end

end

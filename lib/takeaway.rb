class Takeaway
  MENU = {
    "Quarter Chicken" => 4,
    "Half Chicken" => 8,
    "Whole Chicken" => 13,
    "Chicken Wing" => 1
  }

  def initialize
    @order = {}
  end

  def menu
    MENU.map { |dish, price| "#{dish}: £#{price}" }.join("\n")
  end

  def add_to_order(dish, quantity)
    @order[dish] = quantity
  end

  def current_order
    "Your current order:\n" + @order.map { |dish, quantity| "#{quantity} x #{dish}"}.join("\n")
  end
end

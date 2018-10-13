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

  def add_to_order(dishes, quantities)
    dishes.each { |dish| @order[dish] = quantities[dishes.index(dish)] }
  end

  def current_order
    "Your current order:\n" +
    @order.map { |dish, quantity| "#{quantity} x #{dish}" }.join("\n")
  end

  def check_total
    "£#{total}"
  end

  private

  def total
    @order.map { |dish, quantity|
      MENU[dish] * quantity
    }.reduce(:+)
  end
end

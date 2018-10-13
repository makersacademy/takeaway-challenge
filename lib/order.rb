class Order
  def initialize
    @order = {}
  end

  def current
    "Your current order:\n" + order
  end

  def add(dish, quantity)
    @order[dish] = quantity
  end

  def total
    @order.map { |dish, quantity|
      Menu::MENU[dish] * quantity
    }.reduce(:+)
  end

  private

  def order
    @order.map { |dish, quantity| "#{quantity} x #{dish}" }.join("\n")
  end

end

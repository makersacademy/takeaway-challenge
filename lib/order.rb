require_relative 'menu'

class Order

  def initialize(menu = Menu.new)
    @menu = menu
    @basket = {}
  end

  def add(dish, quantity = 1)
    raise "Sorry, we don't do that dish here." unless @menu.read.has_key?(dish)
    @basket[dish] = quantity
  end

  def summary
    dish_summary + "\nTotal is £#{"%.2f" % basket_total}"
  end

  def check_total(user_total)
    user_total == basket_total
  end

  private

  def dish_summary
    @basket.map { |dish, quantity|
      "#{quantity} x #{dish.capitalize} -- " +
      "£#{"%.2f" % subtotal(dish, quantity)}"
    }.join("\n")
  end

  def subtotal(dish, quantity)
    @menu.read[dish] * quantity
  end

  def basket_total
    @basket.map { |dish, quantity| @menu.read[dish] * quantity }.sum
  end
end

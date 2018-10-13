require_relative 'message'

class Takeaway
  MENU = {
    "Quarter Chicken" => 4,
    "Half Chicken" => 8,
    "Whole Chicken" => 13,
    "Chicken Wing" => 1
  }

  def initialize(txt_message: Message.new)
    @order = {}
    @txt_message = txt_message
  end

  def menu
    MENU.map { |dish, price| "#{dish}: £#{price}" }.join("\n")
  end

  def add_to_order(dishes, quantities)
    dishes.each { |dish| @order[dish] = quantities[dishes.index(dish)] }
  end

  def current_order
    "Your current order:\n" + order

  end

  def check_total
    "£#{total}"
  end

  def place_order(amount)
    raise("Incorrect total provided") unless amount == total
    @txt_message.send
    "Order placed. You will receive a confirmation text message shortly"
  end

  private

  def total
    @order.map { |dish, quantity|
      MENU[dish] * quantity
    }.reduce(:+)
  end

  def order
    @order.map { |dish, quantity| "#{quantity} x #{dish}" }.join("\n")
  end
end

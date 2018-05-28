require_relative "./menu.rb"
require_relative "./confirmation.rb"

class Order
  attr_reader :order
  def initialize(confirmation = Confirmation.new)
    @calculated_sum = 0
    @menu = Menu.new
    @confirmation = confirmation
  end

  def select_dishes(current_order)
    @order = current_order
    raise "Incorrect order - please select a dish from the menu" unless incorrect_order?
    @order
  end

  def checking_total(given_total)
    @given_total = given_total
    raise "Incorrect sum - please retry to place order" unless incorrect_sum?
    @confirmation.send_text
  end

  private
  def incorrect_order?
    (@order.keys - @menu.dish.keys) == []
  end

  def incorrect_sum?
    @order.each{ |dish, number| @calculated_sum += @menu.dish[dish] * number}
    @calculated_sum == @given_total
  end
end

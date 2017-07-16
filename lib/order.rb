require_relative 'menu'

class Order
  attr_reader :menu, :booking, :total_to_pay
  def initialize
    @menu = Menu.new
    @booking = Array.new
    @total_to_pay = 0
  end

  def add_dish(dish, quantity = 1)
    raise "This dish is not on the menu" unless menu.dishes.key?(dish)
    quantity.times { @booking << dish }
    completed_order(dish, quantity)
  end

  def completed_order(dish, quantity)
    @total_to_pay += menu.dishes[dish] * quantity
  end

  def payment(amount)
    raise "Please check the amount, does not match total!" unless amount == @total_to_pay
    puts "Payment has been received, you will receive the test confirmation shortly"
    sent_text
  end
end

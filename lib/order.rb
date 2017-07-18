# require_relative 'menu'
# require_relative 'confirmation'

class Order

  attr_reader :menu, :booking, :total_to_pay, :confirmation
  def initialize(menu, confirmation)
    @menu = menu
    @booking = Array.new
    @confirmation = confirmation
    @total_to_pay = 0
  end

  def print_menu
    @menu.list_dishes
  end

  def add_dish(dish, quantity = 1)
    raise "This dish is not on the menu" unless available?(dish)
    quantity.times { @booking << dish }
    puts "#{dish} added to your order"
    puts "order total: £#{(menu.dishes[dish.to_sym]) * quantity}"
  end

  def completed_order(dish, quantity)
    @total_to_pay += menu.dishes[dish.to_sym] * quantity
  end

  def payment(amount)
    raise "Please check the amount, does not match total!" unless amount == @total_to_pay
    puts "Payment has been received, you will receive the test confirmation shortly"
    @confirmation.sent_text
  end

  def available?(dish)
    menu.dishes.key?(dish.to_sym)
  end
end

require_relative 'menu'
require_relative 'sms_confirmation'

class Takeaway
  attr_reader :open_orders

  def initialize
    @menu = Menu.new
    @new_order = Order.new
    @open_orders = []
  end

  def view_menu
    @menu.print_menu
  end

  def order(*dish_and_quantity)
    check_on_menu(dish_and_quantity)
    @new_order.add_dish(dish_and_quantity)
    confirm_order
    @open_orders << @new_order.dishes
  end

  def check_on_menu(dish_and_quantity)
    (0...dish_and_quantity.length-1).step(2) do |dish|
      fail "Sorry, we do not serve #{dish_and_quantity}" unless @menu.dishes.key?(dish_and_quantity[dish])
    end
  end

  def confirm_order
    SmsConfirmation.new.send_text("Thank you! Your order was placed and will be delivered before #{delivery_time}")
    puts "Sent message to customer"
  end

  def delivery_time
    Time.now + 3600
  end

end

class Takeaway
  require 'require_all'
  require_all 'lib'
  attr_reader :menu, :current_order

  def initialize(menu = Menu.new, order_class = Order, order_calculations = OrderCalculations)
    @menu = menu
    @order_class = order_class
    @current_order = nil
    @order_calculations = order_calculations
  end

  def view_menu
    @menu.print_menu
  end

  def new_order
    @current_order = @order_class.new(@menu)
  end

  def add_to_order(dish_name, quantity = 1)
    @current_order.add(dish_name, quantity)
  end

  def place_order(total, text_message = TextMessage.new)
    err_msg = 'Total cost given is incorrect, please recalculate and try again'
    fail(err_msg) unless check_total(total)

    send_confirmation_text(text_message)
  end

  private

  def check_total(total)
    @order_calculations.check_total(total, @current_order)
  end

  def send_confirmation_text(text_message_object)
    delivery_estimate = (Time.now + 3600).strftime("%H:%M")
    message = "Thank you! Your order was placed and will be delivered before '#{delivery_estimate}'"
    text_message_object.send_text(message)
  end
end

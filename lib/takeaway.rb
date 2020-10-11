require 'twilio-ruby'
require_relative 'menu'
require_relative 'order'
require_relative 'confirmation'

class Takeaway
  attr_reader :order 

  def initialize(menu = Menu.new, order = Order.new, confirmation = Confirmation.new)
    @menu = menu
    @order = order
    @confirmation = confirmation
  end

  def view_menu
    @menu.print_menu
  end

  def add_to_order(item, quantity = 1)
    @menu.item_available?(item) ? @order.add_item(item, quantity) : not_available
  end

  def place_order(payment)
    check_order(payment) ? @confirmation.send_message : incorrect_payment
  end

  private 

  def not_available
    raise "Please select items from the menu."
  end

  def incorrect_payment
    raise "Incorrect payment."
  end

  def check_order(payment)
    @order.calculate_price(@menu) == payment
  end

end

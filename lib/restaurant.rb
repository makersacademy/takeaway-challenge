require_relative 'menu'
require_relative 'order'

class Restaurant

  attr_reader :takeaway, :menu, :current_order

  def initialize(takeaway, menu = Menu.new)
    @menu = menu
    @takeaway = takeaway
    # @current_order = takeaway.order
  end

  def checkout_order(amount)
    fail 'Insufficient payment! Please retry.' if amount < @takeaway.order.calc_total
    @takeaway.reset # @current_order.deliver - should happen before reset, but it is out of scope.
    send_message
  end

  def send_message
    message = "Thank you for your custom! Your order will be delivered before #{Time.now.strftime("%R")}."
  end

end

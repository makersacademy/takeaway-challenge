require_relative "./menu.rb"
require_relative "./order.rb"
require_relative "./sms_client.rb"

class Takeaway
  ERR_INCORRECT_PAYMENT = "Please provide the correct payment for you order. Takeaway.order.total or for a full break down, Takeaway.order.display"
  # Passing in a new menu (with a possible file path) and order
  def initialize(menu = Menu.new, order_class = Order, sms_client = SMSClient.new)
    @menu = menu
    @order = order_class.new
    @sms_client = sms_client
  end
  # I want to export all the public methods of these three classes so do i have to wrap them in takeaway level methods?
  # I imagine in the future i may want to change the takeaway level methods
  # Idk man.

  attr_reader :sms_client, :menu ,:order

  def start_new_order
    @order = order_class.new
  end

  def set_customer_number(customer_number)
    @customer_number = customer_number
  end


  def confirm_order(payment) do
    raise ERR_INCORRECT_PAYMENT if payment != order.total.round(2)
    sms_client.send_message("Thank you! Your order was placed and will be delivered before 18:52")

  end

end
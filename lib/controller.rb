require 'dotenv'
Dotenv.load

class Controller

  PAYMENT_ERROR = "Incorrect Payment! Fork over the money yo!"
  CONFIRMATION_MESSAGE = "Your order is completed. Delivery soon."
  WELCOME_MESSAGE =  "  ≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈
  Welcome to Fake Takeaway. use #list_dishes for menu,
  #update_order to order by number and #checkout to pay
  ≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈
  "

  attr_reader :menu, :order_class, :current_order

  def initialize menu_ofday , order_class , twilio_client
    @twilio_client = twilio_client
    @order_class = order_class
    @menu = menu_ofday
    setup_twilio
  end

  def welcome
    @current_order = @order_class.new menu
    WELCOME_MESSAGE
  end

  def list_dishes
    @menu.list_dishes
  end

  def add_dish dish_number , number = 1
    @current_order.add_dish dish_number , number
    @current_order.update_total
  end

  def checkout payment
    raise PAYMENT_ERROR unless payment == current_order.bill
    send_sms CONFIRMATION_MESSAGE
  end

  private

  def setup_twilio
    account_sid = ENV['TWISID']
    auth_token = ENV['TWITOK']
    @client = @twilio_client.new account_sid, auth_token
    @sender = ENV['SENDER']
    @receiver = ENV['RECEIVER']
  end

  def send_sms message
    @client.account.messages.create(
      from: @sender,
      to: @receiver,
      body: message
    )
  end

end

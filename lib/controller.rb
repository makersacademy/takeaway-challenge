require 'dotenv'
Dotenv.load

class Controller

  PAYMENT_ERROR = "Incorrect Payment! Fork over the money yo!"
  CONFIRMATION_MESSAGE = "Your order is completed. Delivery soon. ID is:"
  GOODBYE_MESSAGE = "Thank you for ordering! You will receive a confirmation
  via SMS soon. In the meantime, use #welcome if you want to order again."
  WELCOME_MESSAGE =  "  ≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈
  Welcome to Fake Takeaway. use #list_dishes for menu,
  #update_order to order by number and #checkout to pay
  ≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈
  "

  def initialize menu_ofday , order_class , twilio_client
    @twilio_client = twilio_client
    @order_class = order_class
    @menu = menu_ofday
    setup_twilio
  end

  def welcome
    setup_new_order
    WELCOME_MESSAGE
  end

  def list_dishes
    @menu.list_dishes
  end

  def show_outstanding_order
    @current_order.show_outstanding_order
  end

  def add_dish dish_number , number = 1
    @current_order.add_dish dish_number , number
    @current_order.update_total
    nil
  end

  def checkout payment
    raise PAYMENT_ERROR unless payment == @current_order.total_bill
    send_sms CONFIRMATION_MESSAGE + @current_order.object_id.to_s
    confirm_transaction
  end

  private

  def setup_new_order
    @current_order = @order_class.new @menu
  end

  def setup_twilio
    @client = @twilio_client.new ENV['TWISID'] , ENV['TWITOK']
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

  def confirm_transaction
    GOODBYE_MESSAGE
  end

end

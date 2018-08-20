require_relative 'message_sender'

class Order

  attr_reader :order_items

  def initialize
    @order_items = []
  end

  def add_item(menu_item)
    @order_items << menu_item
  end

  def print_total
    "The running total of your order is £#{total}"
  end
  
  def print_order
    "Your order details are: #{pretty_print}"
  end

  def place_order(estimated)
    raise "Incorrect total, please try again" if estimated != total
    @message = "Thank you! Your order was placed and will be delivered before #{Time.now}"
    send_message(@message)
    "Order successfully placed!"
  end

  
  
  def send_message(message)
    # To find these visit https://www.twilio.com/user/account
    account_sid = "AC5bc426421c17af3f13cf2f44ca8e7ccf"
    auth_token = "25a60b262c7a3df165b78e8c8e80ab3b"

    @client = Twilio::REST::Client.new account_sid, auth_token

    @message = @client.messages.create(
      to: "+447725799311",
      from: "+447480485261",
      body: message
    )
  end

  #self.send_message("Hello!")




  private
  
  def total
    @order_items.map { | dish |
      dish.price
    }.sum
  end

  def pretty_print
    @order_items.map { | dish |
      "#{dish.name}, £#{dish.price} | "
    }.join
  end

end
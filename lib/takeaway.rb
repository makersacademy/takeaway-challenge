
class Takeaway

  attr_reader :menu

  CURRENT_MENU = { "burger" => 2, "chips" => 1, "kebab" => 3 }

  def initialize
    @menu = CURRENT_MENU
    @current_order = Order.new
  end

  def order(dish, quantity, total)
    @current_order.add(dish, quantity)
    @current_total = total
    raise "You have entered the wrong total" if @menu[dish] * quantity != total

    send_sms

    # if @menu[dish] * quantity == total
    #   send_sms
    # else
    #   raise "You have entered the wrong total"
    # end

  end

  def send_sms
    account_sid = 'ACe6608e52a423ca7f1e73bcf6d34e2c53'
    auth_token = 'fa63712f422de2119ef41c47ff47fd72'
    client = Twilio::REST::Client.new(account_sid, auth_token)

    from = '+441133205009' # Your Twilio number
    to = '+447826028826' # Your mobile phone number

    client.messages.create(
    from: from,
    to: to,
    body: "Thank you! Your order was placed and will be delivered within the next 15 minutes"
    )

    "sms sent"
  end

end


class Takeaway

  attr_reader :menu, :current_total, :current_order

  CURRENT_MENU = { "burger" => 2, "chips" => 1, "kebab" => 3 }

  def initialize
    @menu = CURRENT_MENU
    @current_order = Order.new
    @account_sid = 'ACe6608e52a423ca7f1e73bcf6d34e2c53'
    @auth_token = 'fa63712f422de2119ef41c47ff47fd72'
    @client = Twilio::REST::Client.new(@account_sid, @auth_token)
    @from = '+441133205009' # Twilio number
    @to = '+447826028826' # My mobile phone number
    @body = "Thank you! Your order was placed and will be delivered
    within 1 hour"
    @current_total = 0
  end

  def order(dish, quantity = 1)
    dish_price = @menu[dish]
    @current_order.add(dish, quantity, dish_price)
    @current_total += dish_price * quantity
    send_sms
  end

  def see_order
    @current_order.see
  end

  def send_sms
    @client.messages.create(from: @from, to: @to, body: @body)
    "sms sent"
  end

end

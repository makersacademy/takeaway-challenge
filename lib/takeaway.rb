require 'twilio-ruby'
require_relative 'menu'
require_relative 'order'

class Takeaway

  AUTH_TOKEN = '83e3752f9614e4a7ee27122213d23401'
  ACCOUNT_SID = 'ACbdceab5ffb3a83df647d818777df3c91'
  TWILIO_PHONE = '+441290366057'
  MY_PHONE = '+447460161991'

  attr_reader :order, :order_price

  def initialize(order = Order.new)
    @order = order
    @client = Twilio::REST::Client.new(ACCOUNT_SID, AUTH_TOKEN)
  end

  def is_correct_amount?(price)
    total_price == price
  end


  def basket_summary
    self.order.display_order
  end

  def order_price
    self.order.order_sum
  end


  def send_text
    message = "Thanks, your order arrives before #{Time.new + 60*60}. Your order: #{basket_summary}, You will need to pay: #{@order_price}"
    @client.account.messages.create({from: TWILIO_PHONE, to: MY_PHONE, body: message})
  end

end

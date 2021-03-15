require 'twilio-ruby'

class Takeaway

  attr_reader :order, :menu

  def initialize
    @order = Order.new
    @menu = Menu.new
  end

  def select_dish(dish)
    @order.dishes.push(dish)
  end

  def order_complete(order = @order)
    @time = order.complete
    delivery_confirmation
  end

  def delivery_confirmation
    status = send_message
    delivery_message = "Thank you! Your order was placed and will be delivered before #{@time}"
    raise "Delivery confirmation error" if status == "failed"
    return delivery_message if status != nil
  end

private

  def send_message
    account_sid = ENV['TWILIO_ACCOUNT_SID']
    auth_token = ENV['TWILIO_AUTHTOKEN']

    @client = Twilio::REST::Client.new account_sid, auth_token
    message = @client.messages.create(
        body: "Thank you! Your order was placed and will be delivered before #{@time}",
        to: ENV['MY_PHONE_NUMBER'],
        from: ENV['TWILIO_PHONE_NUMBER'])
    message.status
  end

end

require 'twilio-ruby'
class Takeaway

  attr_reader :menu
  
  def initialize 
    @menu = Dishes.new.dishes
    @order = Order.new
  end

  def show_menu
    @menu
  end

  def add_item(dish, quantity = 1)
    @order.add_to_basket(dish, quantity)
    puts " #{quantity}x #{dish} added to your order. "
  end

  def basket
    @order.order_basket
  end

  def total
    puts '%.2f' % @order.total
  end

  def summary
    puts @order.summary
  end

  def confirmation
    time = Time.now + 3600 
    message = "Thank you! Order was placed and will be delivered by #{time.hour}:" '%.2f' % "#{time.min}"
    send_sms(message)
  end

  def send_sms(message)
    account_sid = ENV['TWILIO_ACC_SID']
    auth_token = ENV['TWILIO_AUTH_TOKEN']
    @client = Twilio::REST::Client.new(account_sid, auth_token)
    message = @client.messages
      .create(
        body: message,
        from: ENV['TWILIO_PHONE_NUMBER'],
        to: ENV['PHONE_NUMBER']
      )
  end

end

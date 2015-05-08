require 'twilio-ruby'

class Restaurant
  attr_reader :menu, :order_recived

  def initialize menu
    @menu = menu.new
    @order_recived = []
  end

  def get order, total, telephone
    time = (Time.now).strftime('%I:%M %p')
    time_delivery = (Time.now + (60 * 60)).strftime('%I:%M %p')
    @order_recived << [order.new_order, time, time_delivery, telephone]
    send_message total, telephone
  end

  def send_message total, telephone
    account_sid = ENV['TWILIO_ACCOUNT_SID']
    auth_token = ENV['TWILIO_AUTH_TOKEN']
    @client = Twilio::REST::Client.new account_sid, auth_token
    message total, telephone
  end

  def message total, telephone
    @client.messages.create(
      from: '+441315104481',
      to: "#{telephone}",
      body: """
            Order recived!
            \rThe total is £ #{total}.
            \rIt will arrive before #{order_recived.last[2]}.
            """
    )
  end
end

require 'rubygems'
require 'twilio-ruby'

require 'time'

class MessageService

  def message_manager(order, total)
    message_creation(order, total)
    send_message
  end

  private

  def message_creation(order, total)
    @message_output = ["Hi, thanks for your order!\n", "Your order is:\n"]
    order.each { |item| @message_output << "#{item[1]}x #{item[0]}\n" }
    @message_output << "Your total is £#{total}\nYour order will be delivered at #{(Time.now + 3600).strftime('%H:%M')}"
  end

  def send_message
    account_sid = 'ACf5316f022f45ff22e4e4dd8ccb549b13'
    auth_token = '14a5756f4b6f6dbb09c83c5ea2f6d203'
    @client = Twilio::REST::Client.new(account_sid, auth_token)

    message = @client.messages
      .create(
        body: @message_output.join,
        from: '+447588720615',
        to: '+447972237937'
      )

    puts message.sid
  end
end

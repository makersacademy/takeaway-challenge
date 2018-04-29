require 'twilio-ruby'

class MessageHandler

  def initialize
    @account_sid = ENV["TWILIO_AC_SID"]
    @auth_token = ENV["TWILIO_AUTH"]
    @client = Twilio::REST::Client.new @account_sid, @auth_token
    @num_to = '+447786026749'
    @num_from = '+441704325019'
  end

  def send_message(order)
    body = generate_message(order)
    send_sms(body)
  end

  private

  def send_sms(body)
    @client.api.account.messages.create(
      from: @num_from,
      to: @num_to,
      body: body
      )
  end

  def generate_message(order)
    "Your #{order.category} order has been received and will be with you by #{time}."\
    " £#{'%.2f' % order.total.round(2)} will be charged to your account"
  end

  def time
    time = Time.now + 1800
    time.strftime("%H:%M")
  end

end

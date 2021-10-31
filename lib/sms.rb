require 'twilio-ruby'

class SMS
  attr_reader :sms, :time

  def initialize
    account_sid = "AC1d19000821ebfa41b7ffd1caafabf172"
    auth_token = "14fcc2dae325f29f0ee7d9919cb640ac"
    @client = Twilio::REST::Client.new account_sid, auth_token
    @recipient = "+447960919231"
    @sender = "+447453258482"
    time = Time.now + 1 * 60 * 60
    @text = "Thanks! Your order was placed and will be delivered before #{time.strftime("%H:%M")}"
  end

  def send_sms
    message = @client.messages.create(
        to: @recipient,
        from: @sender,
        body: message)
    puts message.sid
  end

end

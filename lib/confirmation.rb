require 'twilio-ruby'

class Confirmation

  def initialize
    account_sid = 'AC951a12c5042b401c761036d015fc86ff'
    auth_token = 'a252b704db9b66f594ee16a754ecb567'
    @client = Twilio::REST::Client.new account_sid, auth_token
  end

  def delivery_time
    t = Time.new + 3600
    t.strftime("%I:%M%p")
  end

  def send_SMS
    @client.account.messages.create(
      from: '441580392065',
      to: '07976504440',
      body: "Thank you! Your order was placed and will be delivered before #{delivery_time}."
      )
  end

end

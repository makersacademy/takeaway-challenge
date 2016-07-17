require 'twilio-ruby'

class Confirmation

  def delivery_time
    t = Time.new + 3600
    t.strftime("%I:%M%p")
  end

  def send_sms
    account_sid = 'AC951a12c5042b401c761036d015fc86ff'
    auth_token = 'a252b704db9b66f594ee16a754ecb567'

    @client = Twilio::REST::Client.new account_sid, auth_token

    @client.account.messages.create(
      from: '441580392065',
      to: '07976504440',
      body: "Thank you! Your order will be delivered before #{delivery_time}."
    )
  end

end

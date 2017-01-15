require 'twilio-ruby'


module SMS
  def send_sms(_message)
    account_sid = ENV['TWILIO_ACCOUNT_SID']
    auth_token = ENV['TWILIO_AUTH_TOKEN']
    from = ENV['TWILIO_NO']
    client = Twilio::REST::Client.new account_sid, auth_token
    client.account.messages.create(from: from, to: @user,
      body: "Thank you for your order")
    puts "Your order has been placed, a confirmation text has been sent"
  end
end

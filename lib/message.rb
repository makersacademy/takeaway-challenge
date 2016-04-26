class Message

  def send
    require 'twilio-ruby'

    account_sid = "AC412bbc135865f0af2e2c2968f8b3cb54"
    auth_token = ENV['TWILIO_AUTH_TOKEN']
    from = "+441277424311"
    to = ENV["PHONE_NUMBER"]
    delivery_time = (Time.now + 3600).strftime("%H:%M")

    body = "Thank you! Your order will be delivered before #{delivery_time}"
    @client = Twilio::REST::Client.new account_sid, auth_token
    @client.account.messages.create({
      :from => from,
      :to => to,
      :body => body,
    })
  end

end

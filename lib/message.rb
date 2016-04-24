class Message

  def send(time)
    require 'twilio-ruby'
    account_sid = 'AC412bbc135865f0af2e2c2968f8b3cb54'
    auth_token = '33ed993e5ba200da8628e65ab2f245ed'
    from = '+441277424311'
    to = ENV["PHONE_NUMBER"]
    delivery_time = (time + 3600).strftime("%H:%M")

    body = "Thank you! Your order was placed and will be delivered before #{delivery_time}"
    @client = Twilio::REST::Client.new account_sid, auth_token
    @client.account.messages.create({
      :from => from,
      :to => to,
      :body => body,
    })
  end

end

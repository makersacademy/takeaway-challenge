require 'twilio-ruby'

class Send_SMS

  def confirmation_text(args)
    sender(args)
  end


  private

  def credentials(value)
    return 'AC3c30852abaf447e0f8c4b51eb23b0d01' if value == :sid
    return '5c5c4e416d9ac5b15ce57e0f12eb6d37' if value == :token
    return '+441477652033' if value == :from
  end

  def sender(args)
    message1 = "Thank you! #{args[:name]}, your order was placed and "
    message2 = "will be delivered before #{stamp_time}"
    client = Twilio::REST::Client.new credentials(:sid), credentials(:token)
    client.account.messages.create(from: credentials(:from), to: args[:phone],
    body: message1 + message2)
    args
  end

  def stamp_time
    (Time.now+3600).strftime("%I:%M%p")
  end

end

require 'twilio-ruby'

class SMS

  def send_sms(message)

    account_sid = 'ACa652d2578359f119a110281ad151b0ea'
    auth_token = 'ef6c27cf3a7e2d568a2dca1573c217bd'
    @client = Twilio::REST::Client.new account_sid, auth_token

    @client.account.messages.create({
      :from => '+441287244058',
      :to => '+447511560230',
      :body => message
    })

  end

end

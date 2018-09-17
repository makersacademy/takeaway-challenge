require 'twilio-ruby'

class Confirmation

  def send_text
    account_sid = 'AC4bcca295ad97a98cacde7dc983f7d14a'
    auth_token = '97ff951a0229ab09da6c092b1ebf89a3'

    @client = Twilio::REST::Client.new(account_sid, auth_token)

    from = '+447481363412'
    to =   '+447944602672'

    time = Time.now + 3600
    @client.messages.create(
    from: from, # Your Twilio number
    to:   to, # Your mobile phone number
    body: "Thank you! Your order was placed and will be delivered before #{time.strftime("%H:%M")}"
    )
  end

end

require 'twilio-ruby'

class Phone

  def send_text(order_amount)

      # put your own credentials here
    account_sid = 'ACaea30446288b9ec7ed8abf8fcff00f34'
    auth_token = 'ffe1130efabcb0fb3f0b1d536a1dbfc5'
    time = (Time.new + (60 * 60)).strftime("%H:%M")

      # set up a client to talk to the Twilio REST API
    @client = Twilio::REST::Client.new account_sid, auth_token

    @client.api.account.messages.create({
      from: '+441412800754',
      to: '+447450947387',
      body: "Thank you! Your order of: £#{order_amount}" +
            " was placed and will be delivered before #{time}!"
    })

  end
end

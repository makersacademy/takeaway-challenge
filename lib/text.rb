require 'twilio-ruby'

class Text

  def send_text(message)
    # put your own credentials here
    account_sid = 'AC65ae21135d2364a4ad045bd634c4c82f'
    auth_token = '0f4c6c42987696a3b1ab8f6298330650'
    # set up a client to talk to the Twilio REST API
    @client = Twilio::REST::Client.new account_sid, auth_token
    @client.account.messages.create(
      from: '+441620282038',
      to: '+447934491522',
      body: message
    )
    end

end

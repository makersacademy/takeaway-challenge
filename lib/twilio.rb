require 'twilio-ruby'

class TwilioSMS
  def send(message)
    # put your own credentials here
    account_sid = 'AC84c52b9039676c287afc619813e63e52'
    auth_token = 'aa482aeb0ffec2853fedc20025fb6c9b'

    # set up a client to talk to the Twilio REST API
    @client = Twilio::REST::Client.new account_sid, auth_token

    @client.messages.create(
      from: '+44 1603914052',
      to: '+44 7481 595622',
      body: message
    )
  end
end

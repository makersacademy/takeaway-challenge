require 'twilio-ruby'

class TwilioSMS
  def send(message)
    # put your own credentials here
    account_sid = ENV['TWILIO_ACCOUNT_SID']
    auth_token = ENV['TWILIO_AUTH_TOKEN']
    tel_number_to = ENV['TWILIO_TEL_NUMBER_TO']
    tel_number_from = ENV['TWILIO_TEL_NUMBER_FROM']


    # set up a client to talk to the Twilio REST API
    @client = Twilio::REST::Client.new account_sid, auth_token

    @client.messages.create(
      from: tel_number_from,
      to: tel_number_to,
      body: message
    )
  end
end

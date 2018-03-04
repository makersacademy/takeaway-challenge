require 'twilio-ruby'

class SMS

  def initialize
    ### Authenticate the client ###
    account_sid = ENV['TWILIO_ACCOUNT_SID']
    auth_token = ENV['TWILIO_AUTH_TOKEN']

    ### Initalize the Twilio Client ###
    @client = Twilio::REST::Client.new account_sid, auth_token
  end

  def send_sms(body)
    ### Create the message ###
    message = @client.messages.create(
        body: body,
        to: ENV['MY_PHONE_NUMBER'],
        from: ENV['TWILIO_PHONE_NUMBER'])

    puts message
  end

end

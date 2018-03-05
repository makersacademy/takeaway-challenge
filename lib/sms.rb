require 'twilio-ruby'

class SMS

  def initialize
    @account_sid = ENV['TWILIO_ACCOUNT_SID']
    @auth_token = ENV['TWILIO_AUTH_TOKEN']
  end

# Updated this class during code review session
# client_class is our web object which we set by default to our real
# client class but having it as an argument allows us to test this in RSpec
  def send_sms(body, client_class = Twilio::REST::Client)
    @client = client_class.new @account_sid, @auth_token

    message = @client.messages.create(
        body: body,
        to: ENV['MY_PHONE_NUMBER'],
        from: ENV['TWILIO_PHONE_NUMBER'])

    puts message
  end
  
end

require 'rubygems'
require 'twilio-ruby'

class SMS

  def self.send_sms(message)

    account_sid = ENV["TWILIOSID"]
    auth_token = ENV["TWILIOAUTHTOKEN"]

    @client = Twilio::REST::Client.new account_sid, auth_token
    message = @client.messages.create(
        body: message,
        to: "+447794991782",    # Replace with your phone number
        from: "+441984250049")  # Replace with your Twilio number

    puts message.sid
    puts @client.http_client.last_response.status_code

  end

end

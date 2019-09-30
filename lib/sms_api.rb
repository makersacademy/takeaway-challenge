# Download the twilio-ruby library from twilio.com/docs/libraries/ruby
require 'twilio-ruby'

# account_sid =
# client = Twilio::REST::Client.new(account_sid, auth_token)
#
# from =  # Your Twilio number
# to =  # Your mobile phone number
#
# client.messages.create(
# from: from,
# to: to,
# body: "Hey friend!"
# )
#


class SmsMessage
  
  def intialize(client_class=Twilio::REST::Client)
    @sid = ENV['TWILIO_SID']
    @token = ENV['TWILIO_TOKEN']
    @from = ENV['From']
    @client = client_class.new(@sid, @token)
    @client_class = client_class
end

  def send_sms(to, text)
    @client.messages.create(
      from: @from,
      to: to,
      body: text
    )
  end

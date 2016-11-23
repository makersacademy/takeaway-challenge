require 'twilio-ruby'

class SMS
  attr_reader :client

def initialize
  account_sid = ENV["TWILIO_ACCOUNT_SID"]# Your Account SID from www.twilio.com/console
  auth_token = ENV["TWILIO_AUTH_TOKEN"]   # Your Auth Token from www.twilio.com/console
  @client = Twilio::REST::Client.new account_sid, auth_token

end
def send_confirmation
  @client.account.messages.create({
    :to => ENV["TWILIO_PHONE"],    # Replace with your phone number
    :from => ENV["TWILIO_DESTINATION_PHONE"],  # Replace with your Twilio number
    :body => "Thank you! Your order was placed and will be delivered by #{in_an_hour}."
  })
end

  private
  attr_reader :in_an_hour

  def in_an_hour
    time = (Time.new + (60 * 60)).strftime('%H:%M')
  end

end

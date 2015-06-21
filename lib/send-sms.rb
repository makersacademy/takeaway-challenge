require 'rubygems'
require 'twilio-ruby'

class Textsender

  def initialize
    account_sid = 'ACd15ab842ef09376b39f5347ddc7c6bf1'
    auth_token = 'bd07746d563aa96ff4a2cf25d4c5bd6f'
    @client = Twilio::REST::Client.new account_sid, auth_token
  end

  def send_message
    message = @client.account.messages.create(
      :body => "Thank you, your order was placed and will be delivered before #{Time.now+3600}",
      :to => "+447947634555",     # Replace with your phone number
      :from => "+441252236319")   # Replace wi'h your Twilio number
    puts message.sid
  end

end

# t = Textsender.new
# t.send_message

require 'twilio-ruby'

require '/Users/student/Documents/week 2/we_challenge/credentials.rb'

class Message

  def send(total)
    set_credentials
    @client = Twilio::REST::Client.new @account_sid_test, @auth_token_test
    message = @client.messages.create(
      body: "Your order is #{total} GBP and will be delivered within one hour",
      to: "+4917680523707",
      from: "+15005550006")
    puts message.sid
  end

end

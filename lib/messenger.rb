require 'twilio-ruby'

module Messenger

  def self.send(message)
    account_sid = "AC6d991795435c3889fe1c039dcb18be9c"

    # Your Account SID from www.twilio.com/console
    auth_token = "32fec6f622f752d95cb1423e3a2458e5"   # Your Auth Token from www.twilio.com/console

    @client = Twilio::REST::Client.new account_sid, auth_token
    message = @client.messages.create(
      body: message,
      to:  "+447885758652",    # Replace with your phone number
      from: "+441274288767")  # Replace with your Twilio number
  end
end

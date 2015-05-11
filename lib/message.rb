require 'twilio-ruby'

class Message
  # Note that I'm using test credentials for sid, auth and from_no
  # As far as I can tell, there's no way of using live SMS without paying

  def initialize
    @account_sid = ENV['TWILIO_ACCOUNT_SID']
    @auth_token = ENV['TWILIO_AUTH_TOKEN']
    @sender = ENV['MY_FROM_NUMBER']
  end

  def send(customer, time)
    message = "Thank you! Your order was placed and will be "
    message += "delivered before #{ (time + (60 * 60)).strftime("%I:%M%p") }"
    # set up a client to talk to the Twilio REST API
    # I wonder if this should be in initialize?
    @client = Twilio::REST::Client.new @account_sid, @auth_token

    @client.account.messages.create(from: @sender,
                                    to: customer.mobile_number,
                                    body: message)
  end

end

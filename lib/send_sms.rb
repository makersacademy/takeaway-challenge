# Download the twilio-ruby library from twilio.com/docs/libraries/ruby
require 'twilio-ruby'
require 'date'

class TextSender

  def initialize
    account_sid = 'AC18af40eade7f02cfc5bba5f7dcc4ee9d'
    auth_token = 'ff331838f28fcb4157489677de57840c'
    @client = Twilio::REST::Client.new(account_sid, auth_token)

    @from = '+447480538110'
    @to = '+447587518687' # ALTER THIS NUMBER IN ORDER TO RECEIVE TEXT CONFIRMATIONS TO YOUR OWN PHONE
  end

  def send_text
    time = Time.now
    delivery_time = time + (60 * 60)

    @client.messages.create(
    from: @from,
    to: @to,
    body: "Thank you, your order has been placed! It should arrive before #{delivery_time.strftime('%R')}"
    )
  end

end

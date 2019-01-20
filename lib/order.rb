require 'twilio-ruby'
require_relative 'printbasket.rb'

class Order
  def place_order(basket)
    send_message(PrintBasket.new.string(basket))
    #just sends text
    #prints basket (or do that in user!)
  end

  private

  def send_message(body)
    @client = Twilio::REST::Client.new(
      account_sid=ENV['TWILIO_ACCOUNT_SID'],
      auth_token=ENV['TWILIO_AUTH_TOKEN']
    )
    message = @client.messages
      .create(
         body: body,
         from: ENV['TWILIO_NUMBER'],
         to: ENV['MY_NUMBER']
       )
    raise("Order couldn't be completed") unless message.status == 'queued'
  end
end

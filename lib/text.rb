require 'rubygems'
require 'twilio-ruby'

class Text

  ACCOUNT_SID = 'AC5275f9aaa1c28fffbfc9ae66f5b49eb1'
  AUTH_TOKEN = '8ed68af1be4a108b5201e1f55303e0d3'

  def initialize
    @client = Twilio::REST::Client.new(ACCOUNT_SID, AUTH_TOKEN)
  end

  def send_message
    @client.messages.create(
                               from: '+15005550006',
                               body: 'Thank you! Your order was placed and will
                               be delivered in 1 hour from now',
                               to: '+447519468660'
                             )
  end
end

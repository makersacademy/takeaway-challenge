# Download the twilio-ruby library from twilio.com/docs/libraries/ruby
require 'twilio-ruby'
require_relative 'text_creator'
class TextSender
  def send_text(text = TextCreator, number)
    
    client = Twilio::REST::Client.new('ACbcbe37aae2d391aa7e8dffc070efb5d0', 'f8d8a3938c776b823ef364fd92932063')

    client.messages.create(
    from: '+447446964753',
    to: number,
    body: text
    )
  end
end

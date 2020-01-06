require 'twilio-ruby'
class Text
  def initialize
    account_sid = 'AC7577be18ff4c44dfcec05d142970729f'
    auth_token = '2420e7872bfc330b6d8931062521d0df'
    @client = Twilio::REST::Client.new(account_sid, auth_token)
  end

  def send_message
   @client.messages.create(
     from: '+12133443820',
     to: '+447703328392',
     body: "Thank you! Your order was placed and will be delivered before 18:52"
)
  end
end

Text.new.send_message


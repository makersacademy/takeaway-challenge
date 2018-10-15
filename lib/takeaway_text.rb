require 'twilio-ruby'

class TextMessage

  def initialize
    account_sid = 'AC1a4f7d8d453918195e2e95bf05c44377'
    auth_token = '5a46e7e8804b6697f3bbe0fad00b954c'
    @client = Twilio::REST::Client.new(account_sid, auth_token)
  end

   def receive_text
     @client.messages.create(
     from: +441902504385,
     to: +447980019710,
     body: "Thank you! Your order was placed and will be delivered before #{delivery_time}"
     )
   end


   def delivery_time
      "#{Time.now.hour + 1}:#{Time.now.min}"
   end

end

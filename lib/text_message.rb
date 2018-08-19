require 'twilio-ruby'

class TextMessage

  def initialize
    account_sid = 'ACa68a50cc917fe7706da4507f4a7bef25'
    auth_token = '9f52e84872d6c32fbdf71d6b360bb1dd'
    @client = Twilio::REST::Client.new(account_sid, auth_token)
  end

  def send_confirmation
    @client.messages.create(
         body: "Thank you! Your order was placed and will be delivered before #{@time}",
         from: '+441799252298',
         to: '+447761876094'
     )
  end

  def order_time
    @time = "#{(Time.now.hour)+1}:#{Time.now.min}"
  end

end

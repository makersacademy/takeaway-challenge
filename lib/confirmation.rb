require 'twilio-ruby'

class Confirmation

  def initialize
    account_sid = "ACb43015c016af0abbacd874a67206acfb"
    auth_token = "ad17d55d34384b150b2df1c46ac38ff0"
    @client = Twilio::REST::Client.new(account_sid, auth_token)
  end

  def delivery_time
    time = Time.now + 60*60
    @time = time.strftime('%H:%M')
  end

  def send_text
    self.delivery_time
    message = @client.messages.create(
        body: "Thank you! Your order was placed and will be delivered before #{@time}",
        to: "+447857391643",
        from: "+447480487590")

    puts message.sid
  end
end

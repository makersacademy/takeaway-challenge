require 'twilio-ruby'

class Text

  def time
    time = Time.new
    min = time.min
    hour = time.hour + 1
    "#{hour}:#{min}"
  end

  def send_text(order)
    account_sid = 'AC87b8e4e94bfb91d008b33f5490fe2005'
    auth_token = 'b1bb60cfe62e8e512215b1291be3ad29'
    @client = Twilio::REST::Client.new account_sid, auth_token

    message = @client.account.messages.create(:body => "Your food will arrive at #{self.time}",
    :to => "+447425162739",
    :from => "+441412804269")
    puts message.to
  end

end
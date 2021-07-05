require 'rubygems'
require 'twilio-ruby'

class Sms
  def send(total)
    account_sid = ENV["TWILIO_SID"]
    auth_token = ENV["TWILIO_TOKEN"]
    @client = Twilio::REST::Client.new(account_sid, auth_token)

    message = @client.messages
     .create(
        body: "Thank you! Your order was placed and will be delivered before #{time}\nYour total is £#{total}",
        from: '+441582380213',
        to: ENV["PHONE_NUMBER"]
      )

    puts message.sid
  end

  private

  def time
    t = Time.now
    t + (60 * 60)
  end
end

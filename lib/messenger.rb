require 'twilio-ruby'
require 'dotenv'
Dotenv.load
class Messenger 
  ENV['S3_BUCKET']
  def send_order_notification
    account_sid = ENV["ACCOUNT_SID"]
    auth_token = ENV["AUTH_TOKEN"]
    client = Twilio::REST::Client.new(account_sid, auth_token)

    from = ENV["TWILIO_NUMBER"] # Your Twilio number
    to = ENV["RECIPIENT_NUMBER"] # Your mobile phone number
    message = "Thank you! Your order was placed and will be delivered before #{delivery_time} "

    client.messages.create(
    from: from,
    to: to,
    body: message
    )
  end
 
  private
  def delivery_time
    time = Time.now + (60 * 60 * 1)
    time.strftime "%H:%M"
  end
end


# t = Time.now         #=> 2007-11-19 08:22:21 -0600
# t + (60 * 60 * 24) 
 
# t.strftime "%Y-%m-%d %H:%M:%S UTC"  #=> "2012-11-10 17:16:12 UTC"
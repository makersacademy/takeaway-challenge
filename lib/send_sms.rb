require 'rubygems'
require 'twilio-ruby'
class Send_sms
  def delivery_time
    delivery_time = (Time.now + 3600) # time now plus 1 hour
    delivery_time = delivery_time.strftime("%I:%M %p") # formats time to 12 hour format
  end

  account_sid = ENV['TWILIO_ACCOUNT_SID']
  auth_token = ENV['TWILIO_AUTH_TOKEN']
  @client = Twilio::REST::Client.new(account_sid, auth_token)

  phone_number = ENV['PHONE_NUMBER']

  message = @client.messages
    .create(
       body: "Thank you! Your order was placed and will be delivered before #{delivery_time}",
       from: '+447411681971',
       to: phone_number
     )

  puts message.sid

end

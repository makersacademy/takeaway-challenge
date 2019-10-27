require 'bundler'
Bundler.require()

$account_sid = ENV['TWILIO_ACCOUNT_SID']
$auth_token = ENV['TWILIO_AUTH_TOKEN']




class Sms
  def initialize
    @client= Twilio::REST::Client.new($account_sid, $auth_token)
  end

  def send_message
    @client.messages.create(
      to: ENV['MOBILE_NUM'],
      from: "+12028757975",
      body: "Thank you! Your order was placed and will be delivered before #{Time.now.hour + 1}:#{Time.now.min}"
    )
  end
end

sms_test = Sms.new
puts sms_test.send_message

class Sms
def initialize

@time_of_delivery = Time.now + (60*60)

 require 'rubygems'
  require 'twilio-ruby'

  account_sid = 'ACf8ff81f566ca0c6e9c209fb2372773d9'
  auth_token = '8356733b1096b16b8a93587bc9983a80'

  @client = Twilio::REST::Client.new account_sid, auth_token

  @client.messages.create(
    from: '+441913280584',
    to: '+447969996662',
    body: "Hello! thankyou for your order! Your food is being prepared and will be with you by #{@time_of_delivery.hour}:#{@time_of_delivery.min}!"
    )
end
end
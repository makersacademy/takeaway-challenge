require 'twilio-ruby'
Bundler.require

class SMS

account_sid = 'ACf6e0c4d420854b295cc9c5033334d2bf'
auth_token = '714dc0ae201acf5366738d7cf88b95b6'

@client = Twilio::REST::Client.new(account_sid, auth_token)

@client.messages.create(
  to: "+447802862385",
  from: "+17279395736",
  body: "Thank you! Your order was placed and will be delivered before 18:52"
)

end

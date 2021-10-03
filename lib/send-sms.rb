require("bundler")
require_relative 'customer'
Bundler.require()
class Sms
 def send(basket,total)
@client = Twilio::REST::Client.new()
@client.messages.create(
  to: ,
  from: ,
  body: "order placed. Basket: #{basket}. Cost: #{total}"
)
end
end
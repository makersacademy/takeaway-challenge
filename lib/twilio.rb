require 'sinatra'
require 'twilio-ruby'

account_sid = "AC9fe5487e5c20a4cfec2dfd6dee34d66c"
auth_token = "533c90990b17e1aa5f43bc25c9208ed1"

@client = Twilio::REST::Client.new account_sid, auth_token

# sending SMS message
@message = client.messages.create(
  to: "+447809713524",
  from: "+441923750685",
  body: "Thank you! Your order has been placed and will be delivered to you before 18.30."
)

# retrieving sent messages
@client.messages.list.each do |message|
  puts message.body
end

# receiving SMS response
post '/receive_sms' do
  content_type 'text/xml'

  response = TWilio::TwiML::Response.new do |r|
    r.Message 'We do not take any changes of orders via text. Please call us 02083114567 on to make an order over the phone.'
  end

    response.to_xml
end

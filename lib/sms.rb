require 'twilio-ruby'

class Twilio_Class

  @account_sid = 'AC5f14dab093fe403c144c070dcc5dbb82'
  @auth_token = ENV["TWILAUTH"]
  @client = Twilio::REST::Client.new(@account_sid, @auth_token)

  @from = '+12056971553'
  @to = ENV['DPHONE']
  @client.messages.create(
      from: @from,
      to: @to,
      body: "Thank you! Your order was placed and will be delivered before 18:52"
  )
end

require 'twilio-ruby'
require 'dotenv/load'

class SMS
def initialize(TWILIO_ACCOUNT_SID, TWILIO_AUTH_TOKEN, TWILIO_NUMBER, CUSTOMER_PHONE_NUMBER)
  account_sid = TWILIO_ACCOUNT_SID
  auth_token = TWILIO_AUTH_TOKEN
  @from = TWILIO_NUMBER
  @to = CUSTOMER_PHONE_NUMBER
end

  @client = Twilio::REST::Client.new account_sid, auth_token

  @client.api.account.messages.create(
    from: @from,
    to: @to,
    body: "Thank you! Your order was placed and will be delivered before 18:52"
  )

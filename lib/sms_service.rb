require 'twilio-ruby'

class SMSService

  def send_confirmation
  account_sid = "AC334b02e571b0fccd10585c28878a8ad5" # Your Account SID from www.twilio.com/console
  auth_token = "203fa00b5e932163bd83389fd9cbc2a6"   # Your Auth Token from www.twilio.com/console

  @client = Twilio::REST::Client.new account_sid, auth_token
  message = @client.messages.create(
      body: "Thank you! Your order was placed and will be delivered within 1 hour!",
      to: "+447702153125",    # Replace with your phone number
      from: "+441681292023")  # Replace with your Twilio number

  # puts message.sid
  return message.body
  end
end

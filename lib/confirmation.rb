require 'twilio-ruby'

class Confirmation
  account_sid = 'AC4bcca295ad97a98cacde7dc983f7d14a' # set env variables https://www.twilio.com/blog/2017/01/how-to-set-environment-variables.html
  auth_token = '97ff951a0229ab09da6c092b1ebf89a3' # set env variables

  @client = Twilio::REST::Client.new(account_sid, auth_token)

  from = '+447403926214' # Your Twilio number  # set env variables
  to = '+447944602672' # Your mobile phone number  # set env variables

  time = Time.now + 3600
  @message = @client.messages.create(
  from: from,
  to: to,
  body: "Thank you! Your order was placed and will be delivered before #{time}"
  )
end

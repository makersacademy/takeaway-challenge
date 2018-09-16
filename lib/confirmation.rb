require 'twilio-ruby'

class Confirmation

  def send_text
  account_sid = 'AC4bc..........................'
  auth_token = '97ff............................'

  @client = Twilio::REST::Client.new(account_sid, auth_token)

  time = Time.now + 3600
  message = @client.messages.create(
  from: '+4474......', # Your Twilio number
  to: '+447944......', # Your mobile phone number
  body: "Thank you! Your order was placed and will be delivered before #{time}"
  )
  end

end

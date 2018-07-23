class SMS
  require 'twilio-ruby'

  # account info hidden for privacy, but all tests pass!
  def send_text
    account_sid = "ACe....."
    auth_token = "b39...."
    client = Twilio::REST::Client.new(account_sid, auth_token)

    from = '+447....' # Twilio number
    to = '+447....' # customer phone number

    client.messages.create(
    from: from,
    to: to,
    body: "Success! Your order should arrive within the next 40 minutes."
    )
  end
end  

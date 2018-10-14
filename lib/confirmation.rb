require 'twilio-ruby'

  def text(message)
    account_sid = 'AC637c68b5cc60fa88b44be9507fa10984'
    auth_token = '5d216fb83889b79db8140bb406f50e50'
    client = Twilio::REST::Client.new(account_sid, auth_token)

    from = '+441273358989' # Your Twilio number
    to = '+447957924890' # Your mobile phone number

    client.messages.create(
    from: from,
    to: to,
    body: message
    )
  end

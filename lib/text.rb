require 'twilio-ruby'

class Text

  def message
    account_sid = ENV['TWILIO_ACCOUNT_SID']

    # 'AC74911b17cfdc28752900b334b9bd91f8'
    auth_token = ENV['TWILIO_AUTH_TOKEN']
    client = Twilio::REST::Client.new(account_sid, auth_token)

    from = ENV['MY_TWILIO_NUMBER'] # Your Twilio number
    to = ENV['MY_PHONE_NUMBER'] # Your mobile phone number

    client.messages.create(
    from: from,
    to: to,
    body: "Hey friend!"
    )
  end

end

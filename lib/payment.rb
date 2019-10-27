require 'twilio-ruby'
require 'dotenv/load'
class Payment

  def confirm
    time = Time.new
    time_now = time.strftime("%k:%M")
    execute("Your order will arrive at #{time_now}")
  end

  def execute(message)
    account_sid = ENV["TWILIO_ACCOUNT_SID"]
    auth_token = ENV["TWILIO_AUTH_TOKEN"]
    client = Twilio::REST::Client.new(account_sid, auth_token)

    from = ENV["TWILIO_PHONE_NUMBER"]
    to = ENV["MY_PHONE_NUMBER"]

    client.messages.create(
    from: from,
    to: to,
    body: message
    )
  end

end

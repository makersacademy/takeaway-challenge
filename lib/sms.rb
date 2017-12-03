require "twilio-ruby"
require "envyable"
Envyable.load("./config/env.yml", "development")

class SMS

  def send_sms
    account_sid = ENV["TWILIO_ACCOUNT_SID"]
    auth_token = ENV["TWILIO_AUTH_TOKEN"]

    @client = Twilio::REST::Client.new(account_sid, auth_token)

    message = @client.messages.create(
      to: ENV["MY_PHONE_NUMBER"],
      from: ENV["TWILIO_NUMBER"],
      body: "Order successful. Estimated delivery time #{time_now}"
    )

    puts message.sid
  end

  private

  def time_now
    @time = (Time.new + 3600).strftime("%H:%M")
  end

end

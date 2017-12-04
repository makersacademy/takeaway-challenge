require "twilio-ruby"
require "envyable"
Envyable.load("./config/env.yml", "development")

class SMS

  def send_sms(twilio_rest_client = Twilio::REST::Client, env = ENV)
    account_sid = env["TWILIO_ACCOUNT_SID"]
    auth_token = env["TWILIO_AUTH_TOKEN"]

    @client = twilio_rest_client.new(account_sid, auth_token)

    message = @client.messages.create(
      to: env["MY_PHONE_NUMBER"],
      from: env["TWILIO_NUMBER"],
      body: "Order successful. Estimated delivery time #{time_now}"
    )

    puts message.sid
  end

  private

  def time_now
    # @time = (Time.new + 3600).strftime("%H:%M")
    "12:00"
  end

end

require 'twilio-ruby'

class SMS

  def initialize(api = Twilio)
    @account_sid = ENV["TWILIO_ACCOUNT_SID"]
    @auth_token = ENV["TWILIO_AUTH_TOKEN"]
    @client = api::REST::Client.new(@account_sid, @auth_token)
    @delivery = (Time.now + 3600).strftime("%H:%M")
  end

  def send_message

    @client.messages.create(
      to: ENV["PHONENUMBER"],
      from: "+14157023734",
      body: "Your order was placed and will be with you by #{@delivery}."
    )

  end
end

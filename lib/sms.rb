require 'twilio-ruby'

class SMS

  def initialize
    @account_sid = ENV["TWILIO_ACCOUNT_SID"]
    @auth_token = ENV["TWILIO_AUTH_TOKEN"]
    @client = Twilio::REST::Client.new(@account_sid, @auth_token)
  end

  def send
    @client.messages.create(
      to: ENV["MY_PHONE_NUMBER"],
      from: 'MG064ccb0f27255bf723f94fda7983dc48',
      body: "Your food is coming"
    )
  end
end

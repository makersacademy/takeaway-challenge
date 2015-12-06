require 'twilio-ruby'

class Text

  attr_reader :message

  def send(working_number = "+441202835326")

    account_sid = ENV["TWILIO_ACCOUNT_SID"]
    auth_token = ENV["TWILIO_AUTH_TOKEN"]

    @client = Twilio::REST::Client.new account_sid, auth_token

    @message = @client.messages.create(
      to: ENV["MY_MOBILE_NUMBER"],
      from: working_number,
      body: "Thanks! Your order will be delivered before #{time_in_one_hour}"
    )
  end

  private

  def time_in_one_hour
    (Time.now+60*60).strftime("%I:%M%p")
  end


end

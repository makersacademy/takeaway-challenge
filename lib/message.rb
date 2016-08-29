require 'twilio-ruby'


class Message

  def send_confirmation

    account_sid = ENV["TWILIO_ACC_SID"]
    auth_token = ENV["TWILIO_AUTH_TOKEN"]
    @client = Twilio::REST::Client.new account_sid, auth_token

    @message = @client.messages.create(
    to: "+447391449184",
    from: "+441422400664",
    body: "Thank you! Your order was placed and will be delivered before 18:52"
    )
  end

end

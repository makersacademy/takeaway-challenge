require 'twilio-ruby'


class Message

  attr_reader :phone_number

  def initilize
    @phone_number = ""
  end

  def send_confirmation

    account_sid = ENV["TWILIO_ACC_SID"]
    auth_token = ENV["TWILIO_AUTH_TOKEN"]
    @client = Twilio::REST::Client.new account_sid, auth_token

    @message = @client.messages.create(
    to: phone_number,
    from: "+441422400664",
    body: "Thank you! Your order was placed and will be delivered before 18:52"
    )
  end

  def set_phone_number(number)
    @phone_number = number
  end

end

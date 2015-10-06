require 'twilio-ruby'
require 'dotenv'
Dotenv.load

class Text

  attr_reader :sender, :client, :delivery_time

  def delivery_time
    @delivery_time = (Time.new + 3600).strftime("%H:%M")
  end

  def send_message
  twilio_sid = 'AC6bc3bdc8a652039b67ded216da24ea1e'
  twilio_token = 'd4411929f8c15d800b6ce5debe86e896'
  twilio_phone_number = 441793250274
  my_number = +447400606699

  @twilio_client = Twilio::REST::Client.new twilio_sid, twilio_token

  @twilio_client.account.messages.create(
    body: "Your order has been confirmed." \
      " It will be delivered before #{delivery_time}",
    to: my_number,
    from: twilio_phone_number)
  end

  # at some stage would like to use environmental variables below instead
  # def send_message
  # twilio_sid = ENV['ACCOUNT_SID']
  # twilio_token = ENV['AUTH_TOKEN']
  # twilio_phone_number = ENV['TWILIO_NUMBER']
  # my_number = ENV['NUMBER']
  #
  # @twilio_client = Twilio::REST::Client.new twilio_sid, twilio_token
  #
  # @twilio_client.account.messages.create(
  #   body: "Your order has been confirmed. It will be delivered before #{delivery_time}",
  #   to: my_number,
  #   from: twilio_phone_number)
  # end
end

require 'dotenv' # Loads the .env file with credentials

class Message

  attr_reader :phone_number, :message

  def initialize
    @phone_number = nil
    @message = nil
  end

  def send_message
    ask_for_number
    create_message
    # twilio_sms
  end

  def ask_for_number
    puts "Please insert your phone number:"
    @phone_number = gets.chomp.to_s
  end

  def create_message
    @message = "Thanks for your order at Jara's Takeway.
    Your food will be with you before #{delivery_time}"
  end

  # IT IS NOT LOADING THE .ENV CREDENTIALS

  # def twilio_sms
  #   account_sid = TWILIO_ACCOUNT_SID
  #   auth_token = AUTH_TOKEN
  #   client = Twilio::REST::Client.new(account_sid, auth_token)
  #
  #   from = '+44 1277 424717'
  #   to = @phone_number
  #
  #   client.messages.create(
  #   from: from,
  #   to: to,
  #   body: @message
  #   )
  # end

  # private

  def delivery_time
    delivery_time = (Time.now + 1 * 60 * 60).strftime("%k:%M")
  end
end

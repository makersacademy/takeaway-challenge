require 'dotenv/load' # Loads the .env file with credentials
require 'twilio-ruby'

class Message

  attr_reader :phone_number, :message

  def initialize
    @phone_number = nil
    @message = nil
  end

  def send_message
    ask_for_number
    create_message
    twilio_sms
  end

  def ask_for_number
    puts "Please insert your phone number:"
    @phone_number = gets.chomp.to_s
  end

  def create_message
    @message = "Thanks for your order at Jara's Takeway.
    Your food will be with you before #{delivery_time}"
  end

  def twilio_sms
    account_sid = ENV["TWILIO_ACCOUNT_SID"] # Calls the value from .env
    auth_token = ENV["AUTH_TOKEN"]
    client = Twilio::REST::Client.new(account_sid, auth_token)

    client.messages.create(
    from: ENV["TWILIO_NUMBER"],
    to: @phone_number,
    body: @message
    )
  end

  # private

  def delivery_time
    delivery_time = (Time.now + 1 * 60 * 60).strftime("%k:%M")
  end
end

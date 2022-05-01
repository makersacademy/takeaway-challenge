require 'twilio-ruby'

class Text
  ACCOUNT_SID = ENV['TWILIO_ACCOUNT_SID']
  AUTH_TOKEN = ENV['TWILIO_AUTH_TOKEN']
  FROM_NUMBER = ENV['FROM_NUMBER']
  TO_NUMBER = ENV['TO_NUMBER']

  def initialize(
    client = Twilio::REST::Client.new(
      ACCOUNT_SID, AUTH_TOKEN)
  )
    @client = client
  end

  def send_completion_message(completion_time)
    completion_message = "Thanks for your order!
    Our chefs are already busy preparing your food,
    and then it will be on it's way to you in no time.
    Listen out for the doorbell around #{completion_time}"

    send(completion_message)
  end

  private

  attr_reader :client

  def send(message)
    new_text = client.messages.create(
      body: message,
      from: FROM_NUMBER,
      to: TO_NUMBER
    )
  end
end

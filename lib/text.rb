require 'twilio-ruby'

class Text
  ACCOUNT_SID = ENV['TWILIO_ACCOUNT_SID']
  AUTH_TOKEN = ENV['TWILIO_AUTH_TOKEN']
  FROM_NUMBER = ENV['FROM_NUMBER']
  TO_NUMBER = ENV['TO_NUMBER']

  COMPLETION_MESSAGE_BODY = "Thanks for your order! Our chefs are already busy preparing your food, and then it will be on it's way to you in no time. Listen out for the doorbell around "

  def initialize(
    client = Twilio::REST::Client.new(ACCOUNT_SID, AUTH_TOKEN)
  )
    @client = client
  end

  def send_completion_message
    message = client.messages.create(
        body: COMPLETION_MESSAGE_BODY,
        from: FROM_NUMBER,
        to: TO_NUMBER
      )
  end

  private

  attr_reader :client
end

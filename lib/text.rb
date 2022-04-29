require 'twilio-ruby'

class Text
  ACCOUNT_SID = ENV['TWILIO_ACCOUNT_SID']
  AUTH_TOKEN = ENV['TWILIO_AUTH_TOKEN']
  FROM_NUMBER = ENV['FROM_NUMBER']
  TO_NUMBER = ENV['TO_NUMBER']

  def initialize(message_body)
    @client = Twilio::REST::Client.new(ACCOUNT_SID, AUTH_TOKEN)

    message = @client.messages.create(
        body: message_body,
        from: FROM_NUMBER,
        to: TO_NUMBER
      )
  end
end

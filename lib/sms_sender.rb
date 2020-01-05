require 'twilio-ruby'

class Sms
  def initialize(twilio_id, twilio_token, twilio_number)
    @account_sid = twilio_id
    @auth_token = twilio_token
    @twilio_number = twilio_number
    @client = Twilio::REST::Client.new(@account_sid, @auth_token)
    @error_log = []
  end

  def send(message, client)
    begin
    @client.messages.create(
      from: @twilio_number,
      to: client,
      body: message
    )
    rescue => e
      @error_log << e
      raise "Number not valid"
    end
  end
end

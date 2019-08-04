require 'twilio-ruby'
class SMSClient
  def initialize(account_sid, auth_token)
    @client = Twilio::REST::Client.new(account_sid, auth_token)
  end

  def set_from_number(from_number)
    @from_number = from_number
  end

  def set_to_number(to_number)
    @to_number = to_number
  end

  def send_message(message)
    @client.messages.create(
      from: @from_number,
      to: @to_number,
      body: message
      )
  end
end

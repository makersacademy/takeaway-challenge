require 'twilio-ruby'
class SMSClient
  ERR_NO_CLIENT = 'Client has not been created. Please run :set_credentials'
  ERR_NO_TO_NUMBER = 'No recipient set for message'
  # def initialize(account_sid, auth_token)
  #   @client = Twilio::REST::Client.new(account_sid, auth_token)
  # end

  def set_credentials(account_sid,auth_token,from_number)
    @client = Twilio::REST::Client.new(account_sid, auth_token)
    @from_number = from_number
    return
  end

  # def set_from_number(from_number)
  #   @from_number = from_number
  # end
  def has_been_set?
    !!@client && !!@from_number
  end
  def set_to_number(to_number)
    @to_number = to_number
  end

  def send_message(message)
    raise ERR_NO_TO_NUMBER unless @to_number
    @client.messages.create(
      from: @from_number,
      to: @to_number,
      body: "message"
      )
  end
end

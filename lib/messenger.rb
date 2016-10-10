require 'twilio-ruby'

class Messenger

  def initialize
    @client = Twilio::REST::Client.new(account_sid, auth_token)
  end

  def send_text(message, number)
    @client.messages.create(
      from: twilio_phone_number,
      to: number,
      body: message
    )
  end

  private

  def account_sid
    'AC27e5e5a2ed8511082f2c132be0dfde5f'
  end

  def auth_token
  'cb735f5b7e5034b50558d058f67621ae'
  end

  def twilio_phone_number
    '+441143032602'
  end
end

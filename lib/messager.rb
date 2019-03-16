# Download the twilio-ruby library from twilio.com/docs/libraries/ruby
require 'twilio-ruby'

class Messager

  def initialize(
    customer_number = nil,
    send_number = '+447427588503'
  )

    @send_number = send_number
    @receive_number = customer_number

  end

  def send_sms(message)

    unless message.nil? || @send_number.nil?

      account_sid = 'AC97abd4b506ad5d4ec59ca886227a21ea'
      auth_token = '6e48f0377408fd3c364daad172641952'
      client = Twilio::REST::Client.new(account_sid, auth_token)

      from = @send_number # Your Twilio number
      to = @receive_number # Your mobile phone number

      client.messages.create(
      from: from,
      to: to,
      body: message
      )

    end

  end

end

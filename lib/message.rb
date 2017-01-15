require 'yaml'
require 'twilio-ruby'

class Message
  def initialize(amount)
    @amount = amount
    initiate_twilio_client
  end

  def send_sms
    triger_twilio_sms
    rescue Twilio::REST::RequestError => e
    puts e.message
  end

  private

  def initiate_twilio_client
    account_sid = 'ACcd05917f7ea7e479a69506039b1d0898'
    auth_token  = 'ccf501f3df91ed70d4d426fcf2c6553d'
    @client = Twilio::REST::Client.new(account_sid, auth_token)
    #JJ2VEWD3MPiSYmb652NxmhmmTv88JkgmEcliu7oO
  end

  def triger_twilio_sms
    t = Time.new
    alert_message = "Thank you! Your order for the total amount of £#{@amount} was placed and will be delivered before #{t.hour + 1}:#{t.min}."
    phone_number = '+447766444001'
    @client.account.messages.create(
      from:      '+447766444001',
      to:        phone_number,
      body:      alert_message
    )
  end
end

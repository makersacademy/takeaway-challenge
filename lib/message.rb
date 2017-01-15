require 'yaml'
require 'twilio-ruby'

class SMS
  def initialize(amount)
    @amount = amount
    connect_to_twilio_client
  end

  def send_sms
    triger_twilio_sms
    rescue Twilio::REST::RequestError => e
    puts e.message
  end

  private

  def connect_to_twilio_client
    account_sid = 'ACcd05917f7ea7e479a69506039b1d0898'
    auth_token  = 'ccf501f3df91ed70d4d426fcf2c6553d'
    #account_sid = 'AC012c0f0a201bbef787f9620b5269a71d' #TEST
    #auth_token  = 'd33ec8ecc889196962b3d65ccb673e7f' #TEST
    @client = Twilio::REST::Client.new(account_sid, auth_token)
    #JJ2VEWD3MPiSYmb652NxmhmmTv88JkgmEcliu7oO
  end

  def triger_twilio_sms
    t = Time.new
    alert_message = "Thank you! Your order for the total amount of £#{@amount} was placed and will be delivered before #{t.hour + 1}:#{t.min}."
    phone_number = '+447766444001'
    @client.account.messages.create(
      from:      '+441133206201',
      to:        phone_number,
      body:      alert_message
    )
  end
end

require 'yaml'
require 'twilio-ruby'
require 'dotenv'

class SMS
  def initialize(amount)
    @amount = amount
    connect_to_twilio_client
  end

  def send_sms
    triger_twilio_sms
    prints_error_if_any
  end

  private

  def prints_error_if_any
    rescue Twilio::REST::RequestError => e
    puts e.message
  end

  def connect_to_twilio_client
    Dotenv.load
    account_sid = ENV['ACCOUNT_SID']
    auth_token  = ENV['AUTH_TOKEN']
    @client = Twilio::REST::Client.new(account_sid, auth_token)
  end

  def triger_twilio_sms
    Dotenv.load
    t = Time.new
    alert_message = "Thank you! Your order for the total amount of £#{@amount} was placed and will be delivered before #{t.hour + 1}:#{t.min}."
    phone_number = ENV['PHONE_NUMBER']
    @client.account.messages.create(
      from:      ENV['FROM_PHONE'],
      to:        phone_number,
      body:      alert_message
    )
  end
end

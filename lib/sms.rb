require 'yaml'
require 'twilio-ruby'
require 'dotenv'
require 'pry'

class SMS

  def initialize(config = Dotenv.load, client = nil)
    @config = config
    @client = client || Twilio::REST::Client.new(config["ACCOUNT_SID"], config["AUTH_TOKEN"])
  end

  def send_sms(amount)
    prints_error_if_any
    triger_twilio_sms(alert_message(amount))
  end

  private

  def alert_message(amount)
    "Thank you! Your order for the total amount of £#{amount} was placed and will be delivered before #{Time.hour + 1}:#{Time.min}."
  end

  def prints_error_if_any
    rescue Twilio::REST::RequestError => e
    puts e.message
  end

  def triger_twilio_sms(alert_message)
    #binding.pry
    @client.account.messages.create(
      from:       @config['FROM_PHONE'],
      to:         @config['PHONE_NUMBER'],
      body:       alert_message
    )
  end
end

# Research exceptions in ruby
# try to get create to raise an error
# then try to test my condition

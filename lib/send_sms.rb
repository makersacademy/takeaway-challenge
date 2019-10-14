require 'twilio-ruby'
require 'sinatra'
class SendSMS
  # account_sid = ''
  # auth_token = ''
  # client = Twilio::REST::Client.new(account_sid, auth_token)
  #
  # from = '+15551234567' # Your Twilio number
  # to = '+15555555555' # Your mobile phone number
  #
  # client.messages.create(
  # from: '+44 1133201183',
  # to: '+44 7808275626',
  # body: "Hey friend!")
  TIME_FORMAT = "%H:%M"

  def initialize(config, client: )
    @client = client || Twilio::REST::Client.new(config[:account_sid], config[:auth_token])
    @config = config
  end

  def deliver
    client.messages.create(message_args)
  end

  private

  attr_reader :client, :config

  def message_args
    {
      from: config[:from],
      to: config[:to],
      body: config[:body] % delivery_time
    }
  end

  def delivery_time
    (Time.now + 60 * 60).strftime(TIME_FORMAT)
  end

end

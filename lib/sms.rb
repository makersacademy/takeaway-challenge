require 'twilio-ruby'

# for managing sid, api, and phone numbers
require 'dotenv'
Dotenv.load

class SMS
  attr_reader :config

  def initialize(config = {
    account_sid: ENV['SID'],
      auth_token: ENV['TOKEN'],
      from: ENV['RESTAURANT_NUM'],
      to: ENV['CUSTOMER_NUM'],
  })
    @config = config
    @client = Twilio::REST::Client.new(config[:account_sid], config[:auth_token])
  end

  def send_text(msg)
    @client.messages.create(
      from: config[:from],
      to: config[:to],
      body: msg
    )
  end

end

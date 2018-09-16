# Download the twilio-ruby library from twilio.com/docs/libraries/ruby
require 'twilio-ruby'

class SMS
  def initialize
    @client = Twilio::REST::Client.new(DEFAULT_CONFIG[:account_sid], DEFAULT_CONFIG[:auth_token])
  end

  def send(message = 'Hey, there!', to = DEFAULT_CONFIG[:to], from = DEFAULT_CONFIG[:from])
    client.messages.create(
      from: from,
      to: to,
      body: message
    )
    end
  
  private

  attr_reader :client

  DEFAULT_CONFIG = {
    account_sid: 'AC3d8670509df17ad7546b9ec2bcf013dd',
    auth_token: 'e67c55c82113398cd2ae19a7bb538173',
    from: '+441522246322',
    to: '+447986371299'
  }

end

require 'twilio-ruby'

class SMS

  TIME_FORMAT = "%H:%M"

  def initialize(config, client: nil)
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
#
# @@sid = 'ACc5df2096377e1e7750a741f1b7070c0e'
# @@token = '1eaaf670414f471ef367ef34aa2f4f8b'
# @@twilio_number = '+441543624322'
#

#
#  def confirmation
#    @client.messages.create(from: @@twilio_number, to: "+447970000218", body: "Your order has been placed.")


 # end

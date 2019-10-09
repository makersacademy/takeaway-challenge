class Messenger
  require 'twilio-ruby'
  HOUR = 60 * 60

  def initialize(client = Twilio::REST::Client.new(ENV['TWIL_ACC_SID'], ENV['TWIL_AUTH_TOKEN']))
    @client = client
  end

  def sms_confirmation
    @client.messages.create(
      from: ENV['TWIL_NO'],
      to: ENV['MOBILE_NO'],
      body: "Thank you! Your order was placed and will be delivered before #{time_in_hour}"
    )
    "sms confirmation sent"
  end

  private

  def time_in_hour
    (Time.now + HOUR).strftime('%H:%M')
  end
end

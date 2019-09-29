class Messenger
  require 'twilio-ruby'
  HOUR = 60 * 60
  ACCOUNT_SID = ENV['TWIL_ACC_SID']
  AUTH_TOKEN = ENV['TWIL_AUTH_TOKEN']

  def initialize(client = nil)
    @client = Twilio::REST::Client.new ACCOUNT_SID, AUTH_TOKEN
    @client = client if client != nil
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

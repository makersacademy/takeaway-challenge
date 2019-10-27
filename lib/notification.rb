class Notification

  def initialize
    @account_sid = ENV['TWILIO_SSID']
    @auth_token = ENV['TWILIO_AUTH']
  end

  def send_sms
    require 'twilio-ruby'

    client = Twilio::REST::Client.new(@account_sid, @auth_token)
    from = ENV['TWILIO_NUMBER'] # Your Twilio number
    to = ENV['phone_number'] # Your mobile phone number
    client.messages.create(
      from: from,
      to: to,
      body: "Order Placed!
      It will be at your door before #{Time.now + 1 * 60 * 60}!"
    )
  end
end

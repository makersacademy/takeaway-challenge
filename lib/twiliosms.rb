require 'twilio-ruby'
require 'date'

class TwilioSMS

  attr_reader :time

  def initialize(account_sid = ENV["TWILIO_ACCOUNT_SID"], auth_token = ENV["TWILIO_AUTH_TOKEN"])
    @account_sid = account_sid
    @auth_token = auth_token

    @time = Time.now.strftime("%H:%M").split(":")
    @time[0] = @time[0].to_i
    @time[0] += 1
    @time[0] = @time[0].to_s
    @time = @time.join(":")
  end

  def send_sms(from = ENV["TWILIO_MOBILE"])
    client = Twilio::REST::Client.new(@account_sid, @auth_token)

    to = ENV["PERSONAL_MOBILE"]

    client.messages.create(
    from: from,
    to: to,
    body: "Thank you! Your order was placed and will be delivered before #{@time}"
    )
  end

end

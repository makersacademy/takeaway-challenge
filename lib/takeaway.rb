require 'twilio-ruby'

class Takeaway

  attr_reader :account_sid, :auth_token

  def initialize(account_sid, auth_token)
    @account_sid = account_sid
    @auth_token = auth_token
  end

  def send_text
    init_twilio
    @client.messages.create(
      from: '+441357464040',
      to: '+447900411146',
      body: "Your order is complete. You will receive your food at #{time_plus_one}."
    )
  end

  private

  def init_twilio
    @client = Twilio::REST::Client.new @account_sid, @auth_token
  end

  def time_plus_one
    t = Time.new
    hour_plus_1 = t.hour + 1
    "#{hour_plus_1}:#{t.min}"
  end
end

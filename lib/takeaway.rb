require 'twilio-ruby'

class Takeaway

  def initialize(account_sid, auth_token)
    @account_sid = account_sid
    @auth_token = auth_token
    @client = Twilio::REST::Client.new @account_sid, @auth_token
  end

  def send_text
    @client.messages.create(
      from: '+441357464040',
      to: '+447900411146',
      body: "Your order is complete. You will receive your food at #{time_plus_one}."
    )
  end

  private

  def time_plus_one
    t = Time.new
    hour_plus_1 = t.hour + 1
    "#{hour_plus_1}:#{t.min}"
  end
end

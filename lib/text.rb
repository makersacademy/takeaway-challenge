require 'twilio-ruby'
class Text
  def initialize(time = Time.new)
    @time = time
  end

  def send_text (customer_number)
    account_sid = ENV["TWILIO_SID"]
    auth_token = ENV["TWILIO_AUTH"]
    @client = Twilio::REST::Client.new(account_sid, auth_token)
    @client.messages.create(to: customer_number, from:"+441452260248", body: "Thank you! Your order was placed and will be delivered before #{time_plus_one}")
  end

  def time_plus_one
      (@time + 3600).strftime("%H:%M")
  end

end

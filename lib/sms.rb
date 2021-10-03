require 'twilio-ruby'

class SMS
  def initialize
    @client = Twilio::REST::Client.new ENV["ACCOUNT_SID"], ENV["AUTH_TOKEN"]
  end

  def send_sms(mobile_number)
    @client.messages.create(
      from: ENV["SENDING_NUMBER"],
      to: mobile_number,
      body: "Thank you! Your order was placed and will be delivered before #{Time.now.hour + 1}:#{'%02d' % [Time.now.min]}"
    )
  end
end

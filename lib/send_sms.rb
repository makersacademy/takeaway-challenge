require 'twilio-ruby'
require_relative 'order'

class SendSMS

  attr_reader :time

  def initialize(time = Time.now + 3600)
    @time = time
  end

  def send_sms
    client = Twilio::REST::Client.new(ENV["AUTH_SID"], ENV["AUTH_TOKEN"])
  
    client.messages.create(
      from: ENV["TWILIO_MOB"],
      to: ENV["MY_MOB"],
      body: "Thank you, your order is being prepared and will be delivered by #{@time}"
    )
  end
end

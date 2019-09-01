class SMS

  require 'twilio-ruby'

  def initialize
    @client = Twilio::REST::Client.new(ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN'])
  end

  def send(phone_num)
    time = Time.new + 1800
    @client.messages.create(
      from: '+441549260018',
      to: phone_num,
      body: "Your order has been received and should arrive by #{time.hour}:#{time.min}"
      )
  end
end

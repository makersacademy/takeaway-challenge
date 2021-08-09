require 'twilio-ruby'

class SMS

  def initialize
    @client = Twilio::REST::Client.new(ENV['ACC_SID'], ENV['AUTH_TOKEN'])
    @time_in_1_h = Time.now
  end

  def send
    @client.messages.create(
    from: ENV['TWILIO_NUM'],
    to: ENV['PHONE_NUM'],
    body: "Thank you! Your order was placed and will be delivered before #{@time_in_1_h}"
    )
  end

end

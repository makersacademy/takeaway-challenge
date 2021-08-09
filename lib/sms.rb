require 'twilio-ruby'

class SMS

  def initialize
    @client = Twilio::REST::Client.new(ENV['ACC_SID'], ENV['AUTH_TOKEN'])
    @time_in_1_h = Time.now
  end

  def send
    # Had to remove the create method @client.messages.create as I kept getting and error
    # 'create': [HTTP 404] 20404 : Unable to create record (Twilio::REST::RestError)
    @client.messages.create(
    from: ENV['TWILIO_NUM'],
    to: ENV['PHONE_NUM'],
    body: "Thank you! Your order was placed and will be delivered before #{@time_in_1_h}"
    )
  end

end

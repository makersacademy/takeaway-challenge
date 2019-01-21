require 'rubygems'
require 'twilio-ruby'
require 'time'

class SMS

  def initialize
    account_sid = ENV['ACCOUNTSID'];
    auth_token = ENV['AUTHTOKEN'];
    @client = Twilio::REST::Client.new(account_sid, auth_token)
  end

  def set_delivery_time
    delivery_time = Time.now + 3600
    @hour = '%02d' % delivery_time.hour
    @min = '%02d' % delivery_time.min
  end

  def send_confirmation
    message = @client.messages.create(
      body: "Thank you! Your order was placed and will be delivered before #{@hour}:#{@min}",
      from: ENV['TWILIO_NUM'],
      to: ENV['MY_NUM']
    )
  end
end

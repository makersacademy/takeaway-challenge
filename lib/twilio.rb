require 'rubygems'
require 'twilio-ruby'
require 'time'

module Twilio

    account_sid = ENV['ACCOUNTSID'];
    auth_token = ENV['AUTHTOKEN'];
    @client = Twilio::REST::Client.new(account_sid, auth_token)

    delivery_time = Time.now + 3600
    @hour = '%02d' % delivery_time.hour
    @min = '%02d' % delivery_time.min

    def Twilio.send_confirmation
      message = @client.messages.create(
        body: "Thank you! Your order was placed and will be delivered before #{@hour}:#{@min}",
        from: ENV['TWILIO_NUM'],
        to: ENV['MY_NUM']
      )
    end

end

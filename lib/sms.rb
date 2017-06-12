require 'twilio-ruby'
require_relative './timestamp.rb'

class SMS

  def initialize
    @timestamp = Timestamp.new.hour_from_now
    @sms_template = "Your order was placed and will be delivered before #{@timestamp}"
  end

  def send
    client = Twilio::REST::Client.new('ACa34600616f043f317628e4c853f37b86',
    '7ea827db27a726a87e117cb7787c4bfa'
    )
    client.messages.create :to => "+447413404379", :from => "+441582380312",
    :body => @sms_template
  end

end

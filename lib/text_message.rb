require_relative 'sms'

class TextMessage
  attr_reader :handy
  def initialize
    @handy = SMS.new
    @messaging = "Thank you! Your order was placed and will be delivered"\
    " before #{Time.now.hour + 1}:#{Time.now.strftime('%M')}"
  end

  def send_text
    print @messaging
  end

  def sms_send(mobile = ENV["MY_NUMBER"])
    @handy.send_sms(mobile, @messaging)
  end
end

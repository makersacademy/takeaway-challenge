require_relative 'send-sms'

class Message
  def initialize(sms = SendText.new)
    @sms = sms
  end

  def text
    @sms.text_sent
  end
end
require './lib/SMS'

class Takeaway

  attr_reader :message_type

  def initialize(klass)
    @message_type = klass.new
  end

  include SMS

  def accept_order(total)
    "Thank you for your order: £" + total.to_s
    #@message_type.send_sms
  end

end

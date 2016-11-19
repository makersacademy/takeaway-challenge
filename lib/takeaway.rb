require './lib/SMS'

class Takeaway

  attr_reader :message_type
  include SMS

  def initialize(klass)
    @message_type = klass
  end


  def accept_order(total)
    "Thank you for your order: £" + total.to_s
    #@message_type.new.send_sms
  end

end

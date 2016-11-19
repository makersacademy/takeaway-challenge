require './lib/SMS'

class Takeaway

  include SMS

  def accept_order
    "Order has been accepted"
    send_sms
  end

end

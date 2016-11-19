require './lib/SMS'

class Takeaway

  include SMS

  def accept_order(total)
    "Thank you for your order: £" + total.to_s
    #send_sms
  end

end

require './lib/SMS'

class Takeaway

  include SMS

  def accept_order
    send_sms
  end

end

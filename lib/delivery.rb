require './lib/send-sms.rb'

class Delivery

  def confirm
    send_sms
  end

end

require './lib/sendtext'

class Restaurant
  attr_reader :menu, :sendtext

  def initialize(sendtext = SendText.new, menu=Menu.new)
    @menu = menu
    @sendtext = sendtext
  end

  def complete_order(total)
    dly_time = (Time.now + 3600).strftime('%H:%M')
    msg="Order to be delivered by #{dly_time}. Total: #{format('£%.2f', total)}"
    sendtext.send_message(msg)
  end

end

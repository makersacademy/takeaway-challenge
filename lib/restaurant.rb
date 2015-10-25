require './lib/sendtext'

class Restaurant
  attr_reader :menu, :sendtext

  def initialize(sendtext = SendText.new)
    @menu = {"Chips" => 0.89, "Chicken Tikka" => 3.99, "Burger" => 2.99}
    @sendtext = sendtext
  end

  def read_menu
    menu.map {|item, price| "#{item} - #{format('£%.2f', price)}"}
  end

  def complete_order(total)
    dly_time = (Time.now + 3600).strftime('%H:%M')
    msg="Order will be delivered by #{dly_time}. Total: #{format('£%.2f', total)}"
    sendtext.send_message(msg)
  end

end

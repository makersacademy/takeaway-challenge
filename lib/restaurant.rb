require './lib/sendtext'

class Restaurant
  attr_reader :menu, :sendtext
  MENU = {"Chips" => 0.89, "Chicken Tikka" => 3.99, "Burger" => 2.99, "Veggie Wrap" => 4.99}

  def initialize(sendtext = SendText.new)
    @sendtext = sendtext
  end

  def read_menu
    MENU.map {|item, price| "#{item} - #{format('£%.2f', price}"}
  end

  def complete_order(total)
    dly_time = (Time.now + 3600).strftime('%H:%M')
    sendtext.send_message("Order will be delivered by #{dly_time}.\n #{total}")
  end

end

require './lib/sendtext'

class Restaurant
  attr_reader :menu, :sendtext

  def initialize (sendtext = SendText.new)
    @menu = {"Chips" => 0.89, "Chicken Tikka" => 3.99, "Burger" => 2.99, "Veggie Wrap" => 4.99}
    @sendtext = sendtext
  end

  def read_menu
    menu.map {|item, price| "#{item} - #{'£%.2f' % price}"}
  end

  def complete_order(message)
    dly_time = (Time.now + 3600).strftime('%H:%M')
    sendtext.send_message("Thank you for your order.\n It will be delivered by #{dly_time}.\nOrder Summary -\n#{message}")
  end

end

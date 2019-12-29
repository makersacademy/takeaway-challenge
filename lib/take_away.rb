require_relative 'menu'

class TakeAway

  def initialize(menu = Menu.new)
    @menu = menu
  end

  def read_menu
    @menu.dishes
  end

  def complete_order(total_price)
    send_text("Thank you for your oder: £#{total_price}")
  end

  def send_text(message)
    # this method calls the Twilio API
  end

end

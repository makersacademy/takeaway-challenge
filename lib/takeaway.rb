require_relative 'menu'
require_relative 'messenger'
require_relative 'order'

class Takeaway

  def initialize(menu = Menu.new, messenger = Messenger.new, order = Order)
  @menu = menu
  @messenger = messenger
  @order = order
  
  @current_order = nil
  @basket = {}
  end

  def read_menu
  end

  def order(item)
    @current_order = @order.new(item)
  end

  def basket_summary
  end

  def total_price
  end

  def complete_order(price)
    send_text("Thank you for your order: £#{total_price}")
  end

  def send_text(message)
    # this method calls the Twilio API
  end



end


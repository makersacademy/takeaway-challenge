require_relative '../lib/menu.rb'
require_relative '../lib/messenger.rb'

ERROR = "Incorrect price entered"

class Order
  attr_reader :basket

  def initialize(dish = nil, quant = nil, price = nil)
    @basket = [dish, quant, price]
    @current_menu = Menu.new.current_menu
    @messenger = Messenger.new
  end

  def process_order
    raise ERROR unless price_correct?
    "Order completed, a text is on its way"
    send
  end

  private

  def send
    message = "Thank you! Your order was placed and will be delivered before #{time_plus_1}"
    @messenger.send_sms(message)
  end

  def time_plus_1
    Time.now + (1*60*60)
  end

  def price_correct?
    (@current_menu[@basket[0]] * @basket[1]) == @basket[2]
  end
end

require_relative 'menu'
require_relative 'order'
require_relative 'check_total'
require_relative 'text_message'

class Takeaway

  DELIVERY_TIME = 3600

  def initialize(order_instance = Order.new(Menu.new.menu))
    @order = order_instance
  end

  def menu
    make_symbol(hash_formatter(@order.inventory))
  end

  def current_order
    make_symbol(@order.order.map { |item| hash_formatter(item) })
  end
  
  def add(dish)
    @order.add(dish)
  end

  def check_total(checker = CheckTotal.new)
    checker.check_total(@order.order)
  end

  def place_order(texter = TextMessage.new)
    texter.sms_send(create_message)
  end

  private

  def hash_formatter(hash)
    hash.map { |dish, price| "#{dish}: #{price}" }
  end

  def make_symbol(input)
    input.join(", ").to_sym
  end

  def create_message(time = Time.now + DELIVERY_TIME)
    "Thank you! Your order was placed and "\
    "will be delivered before #{time.strftime("%k:%M")}"
  end

end

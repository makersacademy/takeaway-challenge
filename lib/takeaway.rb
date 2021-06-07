require_relative 'menu'
require_relative 'twilioadapter'

class TakeAway
  attr_reader :customer_order

  def initialize(menu = Menu.new)
    @menu = menu
    @customer_order = []
  end

  def print_menu
    @menu.print
  end

  def select_dish(name)
    raise "We don't have that, sorry" unless on_the_menu?(name)
    
    @customer_order << name
  end

  def total
    raise "You haven't added any dishes" unless ordered?

    @customer_order.map { |name| ask_menu_for_price(name) }.inject(:+)
  end

  def order
    puts "That will be £#{total} please."
    clear_customer_orders
    puts 'Thanks for your order!'
    send_text
  end

  def delivery_time
    Time.now + 60 * 60
  end

  private

  def ask_menu_for_price(name)
    @menu.find_price(name)
  end

  def on_the_menu?(name)
    @menu.available?(name)
  end

  def clear_customer_orders
    @customer_order = []
  end

  def ordered?
    !@customer_order.empty?
  end

  def send_text
    message = "Thank you! Your order was placed and will be delivered before #{delivery_time}"
    twilio = TwilioAdapter.new
    twilio.send_sms(message)
  end
end

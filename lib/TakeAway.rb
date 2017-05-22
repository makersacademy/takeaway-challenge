require_relative 'menu'
require_relative 'order'
require_relative 'twilio'

class Takeaway
  attr_reader :basket, :menu

  def initialize
    @menu = Menu.new
    @basket = Order.new
    @sms_provider = Sms.new
  end

  def show_menu
    @menu.print_dishes
  end

  def add_to_order(dish, amount = 1)
    raise "Sorry, that item is not on the menu" unless @menu.dishes.has_key?(dish.to_sym)
    @basket.add(dish.to_sym, amount)
    "#{amount}x #{dish} successfully added to your order"
  end

  def basket_summary
    @basket.summary
  end

  def total
    @basket.calculate_total
  end

  def checkout(amount)
    raise "Sorry, that amount does not match your order total, please try again" unless @basket.try_complete(amount)
    send_message(@basket.summary, Time.now)
    "Order placed - please see text message for delivery details"
  end

  private
  def send_message(order, time)
    @sms_provider.send_sms(order, time + (60*60))
  end
end

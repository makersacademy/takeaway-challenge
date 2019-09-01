require './lib/menu'
require './lib/dish'
require './lib/sms_formatter'
require './lib/send_sms'
require './lib/order'

class Takeaway

  def initialize
    @menu = Menu.new
    @sms_formatter = SmsFormatter.new
    @sms = SendSms.new
  end

  def load_default_dishes
    @menu.add_dish(Dish.new("Spring roll", 4.8))
    @menu.add_dish(Dish.new("Dumplings", 5.6))
    @menu.add_dish(Dish.new("Greek pie", 12.0))
  end

  def handle_sms(sms)
    type, data = @sms_formatter.parse_sms(sms)
    if type == :menu
      handle_sms_menu
    else
      order_dishes, total_price = data
      handle_sms_order(order_dishes, total_price)
    end
  end

  private

  def handle_sms_menu
    menu_dishes = @menu.list_dishes
    reply = @sms_formatter.format_menu(menu_dishes)
    @sms.send_sms(reply)
  end

  def handle_sms_order(order_dishes, total_price)
    @order = Order.new(order_dishes, total_price)
    menu_dishes = @menu.list_dishes
    @order.valid(menu_dishes)
    confirmation = 'Thank you! Your order was placed '\
      'and will be delivered in one hour.'
    @sms.send_sms(confirmation)
  end
end
  
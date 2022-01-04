require_relative 'menu' 
require_relative 'order'
require_relative 'message'
require_relative 'twilio_sms'

class Takeaway
  def initialize(menu_file: "./lib/menu.csv", menu: Menu.new(menu_file), 
    order: Order.new, sms: TwilioSMS.new, message: Message.new(sms))
    @menu = menu
    @order = order
    @message = message
  end

  def menu
    puts @menu
    "To order: bobs.order(dish:4) to order 1, or " \
    "bobs.order(dish: 4, x: 13) if you're really hungry!"
  end

  def order(dish:, x: 1)
    dish, price = @menu.dish_info(dish - 1)
    @order.add(dish, price, x)
    "#{x} x #{dish} - added to your order :)"
  end 

  def unorder(dish:, x: 1)
    dish = @menu.dish_info(dish - 1)[0]
    @order.remove(dish, x)
    "#{x} x #{dish} - removed from your order :)"
  end 

  def basket
    puts @order
    "Order some more items, or if all looks good type: bobs.checkout('+yournumber')"
  end

  def checkout(number)
    timestamp = Time.now
    delivery_time = (timestamp + (60 * 60)).strftime("%H:%M")
    @message.confirm(number, delivery_time)
  end
end

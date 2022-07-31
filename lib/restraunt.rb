require 'send-sms'
class Restraunt
  attr_reader :menu, :order_items, :order_price
  def initialize(send_message = Sendmessage.new)
    @send_message = send_message
    @time = Time.new
    @menu = { Jalfreezi: 5, Korma: 4, Chiken_Tikka_Masala: 5.5,
      Pilau_Rice: 1.5, Egg_Fried_Rice: 1.2 }
    @order_items = []
    @order_price = 0
  end

  def add_to_order(order_item)
    order_error(order_item)
    @order_items << order_item if @menu.include?(order_item)
    add_price(order_item)
    @order_items
  end 

  def order_error(order_item)
    raise "item not on menu" unless @menu.include?(order_item)
  end 

  def add_price(order_item)
    @order_price += @menu[order_item]
  end 

  def complete_order(phonenumber)
    send_confirmation(phonenumber)
    ordertime = @time + 3600
    "Your order has been processed and is expected to arrive by: #{ordertime.strftime("%H:%M%p")}"
  end 

  def send_confirmation(phonenumber)
    @send_message.send_message(phonenumber)
  end 

end

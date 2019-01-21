require_relative 'menu'
require_relative 'twilio'

class Order
attr_reader :menu, :order_list

  def initialize(message = Sendsms.new)
    @menu = Menu.new
    @order_list = []
    @message = message
  end

  def take_order(item, quantity = 1)
    @order_list << {:item => item, :quantity => quantity}
  end

  def calculate_bill
    sum = 0
    @order_list.each do |thing|
      sum += @menu.dishes[thing[:item]] * thing[:quantity]
    end
    sum
  end

  def correct_total?(total_price)
    calculate_bill == total_price
  end

  def finish_order(amount)
   raise "Wrong total!" unless correct_total?(amount)
   @message.send_message("Order complete! Your food is being prepared and will be with you shortly!")
 end
end

require_relative 'send_sms'
require_relative 'dishes'

class Order
  
  attr_reader :selection, :dishes, :sms
  
  def initialize(dishes = Dishes.new, sms = SendSMS.new)
    @dishes = dishes
    @sms = sms
  end
  
  def view_dishes
    dishes.view
  end
  
  def create(selection)
    @selection = selection
  end
  
  def verify(user_total)
    dish_split = selection.split(",")
    total = 0
    dish_split.each do |item|
      dish = item.split("*")[0]
      quantity = item.split("*")[1].to_i
      total += dishes.price_list[dish] * quantity
    end
    error_msg = "Order Error - Total does not match to price list"
    raise error_msg if total != user_total
    sms.send
    "Order placed and sms message sent to confirm delivery"
  end
end

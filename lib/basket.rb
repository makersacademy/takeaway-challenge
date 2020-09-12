require 'send_sms'
class Basket
  
  attr_accessor  :current_order
  def initialize(order_array = [])
    @current_order = order_array
    @price = 0 
    @confirmation = TwilioDetails.new
  end

  def price_total
    @current_order.each {|order| @price += order[:price]}
  end

  def order_summary
    summary = "Order Summary \n"
    @current_order.each {|order| summary +=  "dish: #{order[:food]}, dish price: #{order[:price]} \n"}
    summary += "Total price :#{@price}GBP"
     
  end


  def confirm_order
    time = Time.new
    order_message = "Order Confirmed:\n Total price: #{@price} \n Estimated Delivery: 1 hour" ##{time.hour +1}:#{time.min} "
    @confirmation.send_message(order_message)
  end


end

 #puts testing below to be deleted
y = Basket.new([{ food: "roadkill jumbalaya", price: 7 }, { food: "stawberry lasagne", price: 20 }, { food: "vinegar yogurt", price: 3 }])
y.price_total
y.order_summary
y.confirm_order

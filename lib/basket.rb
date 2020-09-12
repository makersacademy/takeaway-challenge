class Basket
  attr_accessor  :current_order
  def initialize(order_array = [])
    @current_order = order_array
    @price = 0 
  end

  def price_total
    @current_order.each {|order| @price += order[:price]}
  end

  def order_summary
    summary = "Order Summary \n"
    @current_order.each {|order| summary +=  "dish: #{order[:food]}, dish price: #{order[:price]} \n"}
    summary += "Total price :#{@price}GBP"
     
  end

end
=begin
ruby #puts testing below to be deleted
y = Basket.new([{ food: "roadkill jumbalaya", price: 7 }, { food: "stawberry lasagne", price: 20 }, { food: "vinegar yogurt", price: 3 }])
y.price_total
y.order_summary
=end
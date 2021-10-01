class Restaurant 
  attr_reader :order_history, :order

  def initialize(order_class = Order)
    @order_class = order_class
    @order_history = []
    @order = nil
  end 

  

  def start_order
    @order = @order_class.new
  end

  def add_items(*items)
    @order.add_dish(items)
  end

  #I want a start order method that creates an order, 
  
  # Then restaurant. add_item and asks for user input
  #this should then check whether the string input matches any of the items in our menu 
  #if it doesn't raise an error and ask them to try again. 

  def complete_order(order)
    raise "There has been an issue with your order, please try again" if order.check_total == false
    @order_history << order 
    @order = order
  end 

private 

  

end
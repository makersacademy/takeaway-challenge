class Calculator
  def initialize(order, takeaway)
    @order = order
    @takeaway = takeaway
  end

  def calculate
    bill = 0
    order.each {|k, v| bill += takeaway.show_menu[k]*v}
    bill  
  end

  private
  
  attr_reader :order, :takeaway
  

end
class Calculator
  def initialize(order, takeaway)
    @order = order
    @takeaway = takeaway
  end

  def calculate
    order.reduce(0) {|bill, (k, v)| bill + takeaway.show_menu[k]*v}
  end

  private
  
  attr_reader :order, :takeaway
  

end
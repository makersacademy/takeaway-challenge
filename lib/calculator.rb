class Calculator

  def calculate(order, takeaway)
    order.reduce(0) {|bill, (k, v)| bill + takeaway.show_menu[k]*v}
  end

  private
  
  attr_reader :order, :takeaway
  

end
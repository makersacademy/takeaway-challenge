require_relative 'takeaway.rb'
require_relative 'chinese.rb'

class Order

  attr_reader :customer_info, :order
  
  def initialize(customer, *order)
    # order will hold an Array of all arguments due to *
    @customer_info = customer
    @order = order
  end
end

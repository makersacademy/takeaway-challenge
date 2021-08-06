class Customer
  attr_accessor :order, :phone_number
  
  def initialize(phone_number)
    @order = { items: [], total_cost: 0 }
    @phone_number = phone_number
  end
end

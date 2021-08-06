class Customer
  attr_accessor :cart, :phone_number
  
  def initialize(phone_number)
    @cart = []
    @phone_number = phone_number
  end
end

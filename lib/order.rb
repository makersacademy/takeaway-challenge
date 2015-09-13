class Order

  attr_reader :customer_name, :customer_phone_number, :dishes

  def initialize(customer_name, customer_phone_number, dishes)
    @customer_name = customer_name
    @customer_phone_number = customer_phone_number
    @dishes = dishes
  end






end
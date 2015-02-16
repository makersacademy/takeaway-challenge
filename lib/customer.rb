class Customer

  attr_reader :name, :phone_number

  def initialize(name, phone_number)
    @name = name
    @phone_number = phone_number
  end

  def place_order(takeaway, dishes = {}, customer_total)
    takeaway.take_order(self, dishes, customer_total)
  end

end
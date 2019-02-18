class Customer
  attr_reader :name, :address, :phone_number
  def initialize(name, address, phone_number)
    @name = name
    @address = address
    @phone_number = phone_number
  end
end

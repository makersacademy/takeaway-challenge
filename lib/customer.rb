class Customer
  attr_reader :name, :phone_number

  def initialize(name, phone_number)
    @name = name
    @phone_number = phone_number
  end
end

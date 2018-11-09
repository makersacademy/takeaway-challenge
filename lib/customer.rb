class Customer
  attr_reader :name, :address, :number

  def initialize(name)
    @name = name
    @address
    @number
  end

  def add_address(address)
    @address = address
  end

  def add_phone_number(number)
    @number = number
  end

end

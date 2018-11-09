class Customer
  attr_reader :name, :phone_number

  MY_NUMBER = "07889151641"

  def initialize(name)
    @name = name
    @phone_number = MY_NUMBER
  end

end

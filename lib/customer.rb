class Customer

  attr_reader :name
  attr_reader :mobile_number

  def initialize(name, mobile_number)
    @name = name
    @mobile_number = mobile_number
  end

end

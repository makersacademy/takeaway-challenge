class TakeawayCustomer
  attr_reader :name, :number, :dishes
  def initialize(name, number)
    @name = name
    @number = number
    @dishes  = Dishes.new
  end

  def list
    @dishes.dishes
  end
end

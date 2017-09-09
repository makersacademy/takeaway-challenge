class TakeawayCustomer
  attr_reader :name, :number, :dishes
  def initialize(name, number)
    @name = name
    @number = number
    @dishes  = Dishes.new(dishes)
  end

  def list
    @dishes.list
  end
end

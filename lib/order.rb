class Order
  attr_accessor :dishes, :twiliohelper

  def initialize
    @dishes = []
  end

  def total
    total = 0
    @dishes.each do |row|
      dish = row[:dish]
      quantity = row[:quantity]
      total += dish.price * quantity
    end
    total
  end
end

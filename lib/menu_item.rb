class MenuItem
  attr_reader :number, :dish, :price

  def initialize(number:, dish:, price:)
    @number = number
    @dish = dish
    @price = price
  end

end

class MenuItem
# MenuItem instances are basically the dishes from the menu:
# they are instantiated with a number, name, and price (whatever comes from the csv)
# and the object is initialized has named parameters of :number, :name, :price (also on attr_reader)
  attr_reader :number, :dish, :price

  def initialize(number:, dish:, price:)
    @number = number
    @dish = dish
    @price = price
  end

end

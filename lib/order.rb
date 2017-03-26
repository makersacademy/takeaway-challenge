class Order

  attr_reader :items, :price
  attr_writer :items, :price

  def initialize
    @items = []
    @price = 0
  end

end

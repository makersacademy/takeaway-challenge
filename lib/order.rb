class Order

  attr_reader :items, :price

  def initialize
    @items = []
    @price = 0
  end

end

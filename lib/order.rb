class Order
  attr_reader :items

  def initialize
    @items = []
  end

  def add(item_number)
    @items << menu.dishes[item_number - 1]
  end
end
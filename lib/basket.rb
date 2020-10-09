class Basket
  attr_reader :items, :total

  def initialize
    @items = []
    @total = 0
  end

  def add_item(item)
    @items << item
  end
end
class Order
  attr_reader :items_ordered, :items_price
  def initialize
    @items_ordered = []
    @items_price = []
  end
end

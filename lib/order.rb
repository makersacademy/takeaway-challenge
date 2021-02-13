class Order
  attr_reader :items_ordered, :items_price

  def initialize
    @items_ordered = []
    @items_price = []
  end

  def get_bill
    @items_price.sum
  end
end

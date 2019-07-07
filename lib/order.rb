class Order
   attr_reader :basket

  def initialize
    @basket = []
  end

  def add_to_basket(takeaway, index)
    @basket << takeaway.select_item(index)
  end

  def print_basket
  end
end

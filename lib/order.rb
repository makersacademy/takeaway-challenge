class Order

  attr_reader :basket

  def initialize
    @basket = []
  end

  def add_to_order(item)
    @basket << item
    nil
  end

  def show_basket
    @basket.join(', ')
  end
end
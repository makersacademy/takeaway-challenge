class Basket
  attr_accessor :basket

  def initialize
    @basket = []
  end

  def add_item(item)
    @basket << item
  end

  def view_basket
    @basket
  end
end

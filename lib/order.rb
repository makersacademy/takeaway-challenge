require_relative 'menu'

class Order

  attr_reader :basket

  def initialize
    @basket = []
  end

  def add_item(item, quantity)
     quantity.times { add_to_basket(item) }
  end

  def add_to_basket(item)
    @basket << item
  end

end

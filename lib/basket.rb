
class Basket
  attr_reader :items, :total

  def initialize
    @items = []
    @total = 0
  end

  def add_to_basket(item)
    items << item
  end

  def calc_total
    items.map { |item| item.item_price[:price]}.sum
  end

end
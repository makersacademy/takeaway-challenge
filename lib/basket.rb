class Basket

  attr_reader :items, :item_count, :total_price

  def initialize
    @item_count = 0
    @total_price = 0
    @items = []
  end

  def add(item)
    @item_count += item[:quantity]
    @items << item
    @total_price += item[:price]
  end

end

class Basket

  attr_reader :items, :item_count, :total_price

  def initialize
    clear
  end

  def add(item)
    @item_count += item[:quantity]
    @items << item
    @total_price += item[:price]
  end

  def clear
    @item_count = 0
    @total_price = 0
    @items = []
  end

end

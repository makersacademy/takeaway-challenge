class Basket

  attr_reader :basket_items

  def initialize
    @basket_items = []
  end

  def add_(item)
    @basket_items << item
  end

  def remove_(item_index)
    @basket_items.delete @basket_items[item_index]
    @basket_items
  end

  def print_items
    @basket_items.map { |item|
       "#{item.name} -- #{item.price}\n"}.join
  end

  def total_price
    total = []
    @basket_items.each { |item|
       total << item.price }
      "\n\nTotal: #{total.sum}"
  end

  def print_basket
    [print_items, total_price].join
  end

  def empty_basktet
    @basket_items = []
  end

end

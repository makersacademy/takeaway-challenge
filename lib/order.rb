class Order
  attr_reader :items, :total
  def initialize
    @items = {}
    @total = 0
  end

  def add(array)
    array.each do |item|
      itemname = item[0]
      price = item[1].to_i
      @items[itemname] = array.count(item)
      @total += price
    end
  end
end

class Order
  attr_reader :items, :total
  def initialize
    @items = {}
    @total = 0
  end

  # adds to the order
  def add(array)
    array.each do |item|
      itemname = item[0]
      price = item[1].to_i
      @items[itemname] = array.count(item)
      @total += price
    end
  end

  # show the current order
  def show_order
    text = ""
    text << "Your order was:\n"
    @items.each do |key, value|
      text << "#{key} x #{value}\n"
    end
    text
  end
  
end

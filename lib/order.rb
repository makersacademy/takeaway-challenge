class Order
attr_accessor :items

  def initialize
    @items = []
  end

  def total
    total = 0
    @items.each { |item| total += item.price }
    total
  end
  
end

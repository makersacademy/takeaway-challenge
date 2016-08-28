class Order
#let customers order a takeaway
  def initialize(items)
    @items = items
  end

  def place_order(items)
    items.each do |item, quantity|
      order.add(item, quantity)
    end
  end

end

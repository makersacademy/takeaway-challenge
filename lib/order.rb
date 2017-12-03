class Order

  attr_accessor :ordered_items

  def initialize(items = [])
    @ordered_items = items
  end

  def order_item(item)
    @ordered_items << item
  end

  def order_total
    total = 0
    @ordered_items.each { |item|
      total += item[:price]
    }
    total
  end

  def order_view
    @ordered_items.each { |item| puts "#{item[:dish]} :: price - £#{item[:price]}" }
  end

end

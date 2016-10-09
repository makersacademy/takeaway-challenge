class Order

  def initialize
    @items = []
  end

  def add_item(item)
    items << item
  end

  def total_cost
    items.collect { |item| item.cost }.reduce(0, :+)
  end

  def empty?
    items.empty?
  end

  def summary
    itemised_list = items.collect do |item|
      "#{item.quantity} x #{item.item.name}: £#{item.cost}"
    end
    total = "Order total: £#{total_cost}"
    (itemised_list << total).join(", ")
  end

  private
  attr_reader :items

end

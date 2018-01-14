class Order
  attr_reader :items, :total, :time

  def initialize(items)
    raise "Empty order" if items.empty?
    @items = items
    @total = items.inject(0) { |sum, item| sum + item.price }
    @time = Time.new
  end
end

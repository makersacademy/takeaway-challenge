class Order
  attr_reader :items

  def initialize
    @items = []
  end

  def add_items(item, quantity, cost)
    @items << { item: item, quantity: quantity, cost: cost }
    "#{quantity} x #{item} sucessfully added"
  end

  def total
    fail "No items ordered yet!" if items.empty?
    @items.map { |item| item[:quantity] * item[:cost] }.inject(:+)
  end

  def verified?(user_total)
    user_total == total
  end

end

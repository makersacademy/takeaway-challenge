class Order

  attr_reader :items, :takeaway

  def initialize(takeaway)
    @items = Hash.new(0)
    @takeaway = takeaway
  end

  def add_item(dish, quantity)
    @items[dish] += quantity
  end

end

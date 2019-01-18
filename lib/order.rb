class Order
  attr_reader :ordered, :menu

  def initialize(restaurant_menu)
    @ordered = {}
    @menu = restaurant_menu
  end

  def add(item, quantity)
    raise "#{item.name} is not on the menu!" unless menu.has_item?(item)
    @ordered[item.name] = [item.price, quantity]
  end

  def total
    "£%.2f" % @ordered.map { |key, value| value.inject(:*)}.sum
  end
end

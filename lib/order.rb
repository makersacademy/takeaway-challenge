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

  def receipt
    receipt = "Order: "
    ordered.map { |key, value| receipt << "#{key}, £#{value[0]} x x#{value[1]} \n" }
    receipt << "Total Price: comes to #{total}"
  end

end

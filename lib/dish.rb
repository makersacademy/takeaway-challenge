class Dish
  attr_reader :name, :price_per_unit
  attr_accessor :quantity_ordered
  def initialize name, price_per_unit, quantity_ordered = 0
    @name = name
    @price_per_unit = price_per_unit
    @quantity_ordered = quantity_ordered
  end

  def readable_menu
    "#{'%-30s' % (name + ":")} £#{'%5.2f' % price_per_unit}"
  end
  def readable_order
    "#{'%-30s' % (name + ":")} £#{'%5.2f' % (quantity_ordered * price_per_unit)}"
  end
end

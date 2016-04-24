class Order
  attr_reader :ordered_dishes, :menu

  def initialize(menu)
    @ordered_dishes = {}
    @menu = menu
  end

  def add(dish, quantity)
    raise "Cannot be added: not in the menu" unless menu.has_dish?(dish)
    @ordered_dishes[dish] = quantity
  end

  def total
    total_items.reduce{|sum, num| sum += num}
  end

private
  def total_items
    @ordered_dishes.map do |d,q|
    menu.price(d) * q
  end
  end
end

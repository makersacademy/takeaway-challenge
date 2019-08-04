class Takeout
  attr_accessor :order, :menu

  def initialize(menu)
    @menu = menu
    @order = {}
  end

  def add_items(items)
    items.each{ |k, v| menu[k] = v}
  end

  def price
    order.reduce(0) { |sum, (item, value)| sum + (value * menu[item]) }
  end

end

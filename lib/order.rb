class Order

  attr_reader :items

  def initialize(menu)
    @menu = menu
    @items = {}
  end

  def select(item, quantity)
    items[item] = quantity
  end

end

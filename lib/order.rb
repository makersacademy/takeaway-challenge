require_relative 'menu'

class Order
  attr_reader :menu, :items, :total_cost
  def initialize(menu = Menu.new)
    @items = []
    @menu = menu
    @total_cost = 0
  end

  def add_to_order(item, amount)
    raise "Item not found" if menu.items[item].nil?
    raise "Quantity must be greater than 0" if amount < 1
    add_item(item, amount)
  end

  private
  attr_writer :total_cost
  # Possibly refactor item into external struct or class
  def add_item(item, amount)
    update_cost(item, amount)
    items << [item, amount]
  end

  def update_cost(item, amount)
    self.total_cost += menu.get_price(item) * amount
  end
end

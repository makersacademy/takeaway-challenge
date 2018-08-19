class Order

  attr_reader :order, :price

  def initialize(menu = Menu.new)
    @menu = menu
    @order = {}
    @price = 0
  end

  def add_item(name, quantity)
    @order[name] = quantity
  end

  def update_price
  @order.to_a.each { |dish, quant| @price += @menu.dishes[dish] * quant}
  end

end

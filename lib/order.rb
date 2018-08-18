class Order

  attr_reader :order
  def initialize(menu = Menu.new)
    @menu = menu
    @order = {}
    @price = 0
  end

  def add_item(name, quantity)
    @order[name] = quantity
  end

end

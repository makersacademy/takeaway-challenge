class Order

  attr_reader :order

  def initialize
    @order = []
  end

  def add(menu1, item1)
    selection = menu1.menu.select { |menuitem| menuitem[:item] == item1 }
    @order.push(selection[0])
  end

end

class Order

  attr_reader :order

  def initialize
    @order = []
  end

  def add(resturant, dish)
    selection = resturant.menu.select { |item| item[:dish] == dish }
    @order.push(selection[0])
  end

end

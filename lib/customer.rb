
class Customer
  ONLY_ONE = 1
  def initialize(menu = Menu, order = Order)
    @menu = menu.new
    @order = order.new
  end

  def look
    @menu.show
  end

  def choice(name, amount = ONLY_ONE)
    @order.add(name, amount)
  end

  def checkout
    #whats in my basket
  end
end

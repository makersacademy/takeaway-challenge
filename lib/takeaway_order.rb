
class Order

  attr_reader :order, :price, :menu

  def initialize(menu = TakeawayMenu.new)
    @menu, @order, @price = menu, {}, 0
  end

  def add_item(name, quantity)
    @order[name] = quantity
  end

  def return_total
    @order.to_a.each { |dish, amount| @price += @menu.dishes[dish] * amount }
  end

  def pay(amount)
    raise "Incorrect amount, please try again." unless amount == @price
    
  end

end

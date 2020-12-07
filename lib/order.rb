class Order
  
  attr_reader :menu, :dishes, :sms

  def initialize(menu)
    @dishes = {}
    @menu = menu
  end

  def add(dish, quantity)
    fail "#{dish.capitalize} is not on the menu." unless menu.has_dish?(dish)
    dishes[dish] = quantity
  end

  def total
    item_totals.inject(:+)
  end

  def item_totals
    dishes.map { |dish, quantity| menu.price(dish) * quantity }
  end

  def place_order(dishes)
    dishes.each { |dish, quantity| @order.add(dish, quantity) }
    @sms.send
    @order.total
  end

end

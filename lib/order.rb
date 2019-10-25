class Order
  DEFAULT_MENU = {
    curry: 6,
    chips: 2,
    pizza: 6,
    nuggets: 4,
    salad: 3
  }

  attr_reader :menu, :order

  def initialize(menu = DEFAULT_MENU)
    @menu = menu
    @order = []
  end

  def checkout
  end

  def select(item, quantity)
    @order << { meal: item, quantity: quantity, total: (@menu[item.to_sym] * quantity) }
    "Your order will cost £#{total}"
  end

  def total
    total = 0
    @order.each { |hash| total += hash[:total]}
    return total
  end
end

require_relative 'nandos_menu'

class Order
  def initialize(menu: NandosMenu.new)
    @order = {}
    @menu = menu
  end

  def current
    "Your current order:\n" + order
  end

  def add(dish, quantity)
    raise("Item not found on menu") unless on_menu?(dish)
    @order[dish] = quantity
  end

  def total
    @order.collect { |dish, quantity|
      price_of(dish) * quantity
    }.reduce(:+)
  end

  private

  def order
    @order.map { |dish, quantity|
      "#{quantity} x #{dish}"
    }.join("\n")
  end

  def price_of(dish)
    @menu.price(dish)
  end

  def on_menu?(dish)
    @menu.dishes.key?(dish)
  end

end

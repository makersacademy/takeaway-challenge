require_relative 'nandos_menu'

class Order
  def initialize(menu: NandosMenu.new)
    @order = []
    @menu = menu
  end

  def current
    "Your current order:\n" + order
  end

  def add(dish, quantity)
    raise("Item not found on menu") unless on_menu?(dish)
    @order << { dish => quantity }
  end

  def total
    @order.map do |item|
      price_of_item(item)
    end.flatten.reduce(:+)
  end

  private

  def order
    @order.map { |item|
      item.map { |dish, quantity| "#{quantity} x #{dish}" }
    }.join("\n")
  end

  def price_of_item(item)
    item.map do |dish, quantity|
      @menu.dishes[dish] * quantity
    end
  end

  def on_menu?(dish)
    @menu.dishes.key?(dish)
  end

end

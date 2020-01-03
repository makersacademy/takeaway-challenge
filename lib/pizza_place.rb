require "order"

class PizzaPlace

  attr_reader :menu, :order, :text

  def initialize(menu:, order: nil, text: nil)
    @menu = menu
    @order = order || Order.new
    @text = text
  end

  def print_menu
    menu.prints
  end

  def place_order(items)
    items.each do |item, quantity| 
      order.add(item, quantity)
    end
    text.deliver
    order.total
  end

end

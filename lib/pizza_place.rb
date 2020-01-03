require "order"
require "text"

class PizzaPlace

  attr_reader :menu, :order, :text

  def initialize(menu:, order: nil, text: nil)
    @menu = menu
    @order = order || Order.new(menu)
    @text = text  || Text.new
  end

  def print_menu
    menu.prints
  end

  def place_order(items)
    add_items(items)
    text.deliver
    order.total
  end

  def add_items(items)
    items.each do |item, quantity| 
      order.add(item, quantity)
    end
  end

end

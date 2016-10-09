require "order"
require "text"

class Takeaway
  attr_reader :menu, :order, :text

  def initialize(menu:, order: nil, text: nil)
    @menu = menu
    @order = order || Order.new(menu)
    @text = text || Text.new
  end

  def print_menu
    menu.print
  end

  def place_order(dishes)
    lookup_dishes(dishes)
    text.deliver
    order.total
  end

def lookup_dishes(dishes)
  dishes.each do |title, quantity|
    order.add(title, quantity)
  end
end


end

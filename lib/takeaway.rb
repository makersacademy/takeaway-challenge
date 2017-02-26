require 'order'

class Takeaway

attr_reader :menu, :order, :message

  def initialize(menu:, order: nil, message: nil)
    @menu = menu
    @order = order || Order.new(menu)
    @message = message
  end

  def show_menu
    menu.print_menu
  end

  def place_order(dishes)
    dishes.each do |dish, amount|
    order.add(dish, amount)
    end
    message.deliver
    order.total
  end
end

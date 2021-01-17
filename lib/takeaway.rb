require "order"
class Takeaway
  def initialize(menu:, order: nil, sms: nil)
    @menu = menu
    @order = order || Order.new(menu)
    @sms = sms
  end

  def print_menu
    # Displays the menu
    menu.print
  end

  def place_order(dishes)
    # Adds the dishes
    dishes.each do |dish, quantity|
      order.add(dish, quantity)
    end
    # Deliver an sms
    sms.deliver
    # Return the order total
    order.total
  end

    private
  attr_reader :menu, :order, :sms
end

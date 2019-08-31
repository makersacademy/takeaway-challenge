require 'order'
require 'sms'

class Takeaway

  def initialize(menu:, order: nil, sms: nil)
    @menu = menu
    @order = order || Order.new(menu)
    @sms = sms || SMS.new
  end

  def print_menu
    # the double in the test allows us to define print without creating it yet
    @menu.print
  end

  def place_order(dishes)
    add_dishes(dishes)
    sms.deliver
    order.total
  end

  private

  attr_reader :menu, :order, :sms
# splitting out the place order method with new one:
  def add_dishes(dishes)
    @dishes.each do |dish, quantity|
      @order.add(dish, quantity)
    end
  end
end

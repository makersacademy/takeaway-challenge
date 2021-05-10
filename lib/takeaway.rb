require_relative './order.rb'
require_relative './sms.rb'

class Takeaway

  def initialize(menu:, order: nil, sms: nil)
    @menu = menu
    @order = order 
    @sms = sms
  end

  def print_menu
    menu.print
  end

  def place_order(dishes)
    add_dishes(dishes)
    sms.deliver
    order.total
  end

  private

  attr_reader :menu, :order, :sms

  def add_dishes(dishes)
    dishes.each do |dish, quantity|
      order.add(dish, quantity)
    end
  end

end

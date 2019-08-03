require_relative 'order'
require_relative 'sms'


class Takeaway


  attr_reader :menu, :order, :sms

  def initialize(menu: ,order: nil, sms: nil)
    @menu = menu
    @order = order || Order.new(menu)
    @sms = sms || SMS.new
  end

  def show_menu
    menu.show
  end

  def order_dish(dishes)
    add_dishes(dishes)
    sms.deliver
    order.total
  end

  private
  def add_dishes(dishes)
    dishes.each do |dish,quantity|
      order.add(dish,quantity)
    end
  end

end
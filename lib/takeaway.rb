require_relative 'menu'
require_relative 'order'
require_relative 'SMS'


class Takeaway

  def initialize(menu: Menu.new.items, order: Order.new, sms: SMS.new)
    @menu = menu
    @order = order
    @sms = sms
  end

  def display(ordermenu)
    ordermenu.display
  end

  def place_order(dishes)
    add(dishes)
    sms.send
    order.totals
  end

  private

  attr_reader :menu, :order, :sms

  def add(dishes)
    message = "No such dish on the menu"
    dishes.each do |dish, quantity|
      fail message unless menu.find { |x| x[:dish] == dish }
      menu.find do |y|
        order.add(dish, y[:price], quantity) if y[:dish] == dish
      end
    end
  end

end

require_relative 'menu'
require_relative 'order'
require_relative 'SMS'


class Takeaway

  attr_reader :menu

  def initialize(menu: Menu.new, order: Order.new, sms: SMS.new)
    @menu = menu
    @menu_items = Menu.new.items
    @order = order
    @sms = sms
  end

  def display(ordermenu)
    ordermenu.display
  end

  def place_order(dishes)
    add(dishes)
    order.display
    puts ("Order Total = £#{order.totals}").rjust(41)
    sms.send
  end

  private

  attr_reader :order, :sms, :menu_items

  def add(dishes)
    message = "No such dish on the menu"
    dishes.each do |dish, quantity|
      fail message unless menu_items.find { |x| x[:dish] == dish.downcase }
      menu_items.find do |y|
        order.add(dish, y[:price], quantity) if y[:dish] == dish.downcase
      end
    end
  end

end

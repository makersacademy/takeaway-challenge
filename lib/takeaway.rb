require_relative 'menu'
require_relative 'order'
require_relative 'sms'

class TakeAway

attr_accessor :menu, :order_klass, :order, :orders, :sms, :delivery_time

  def initialize(menu_klass, order_klass, sms)
    @menu = menu_klass.new
    @order_klass = order_klass
    @orders = []
    @sms = sms
  end

  def show_menu
    print self.menu.format_list
  end

  def create_order
    self.order = self.order_klass.new
  end

  def add(dish, quantity)
    self.order.add(dish, quantity)
  end

  def show_order
    print self.order.format_order
  end

  def remove_items(index_of_dish_from_order)
    self.order.remove_items(index_of_dish_from_order)
  end

  def order_correct?
    self.order.correct?
  end

  def place_order
    raise NoItemError, "Cannot place an empty order!" if self.order.empty?
    self.orders << order
    self.delivery_time = (Time.now + 3600).strftime("%H:%M")
    message = "Your order will be delivered by #{delivery_time}"
    self.sms.send_text(message)
  end

end

require_relative 'menu'
require_relative 'order'

class TakeAway

  attr_reader :menu

  def initialize(menu = Menu.new, order_klass = Order)
    self.menu = menu
    self.order_klass = order_klass
  end

  def add_to_order(dish, quantity = 1)
    new_order unless order
    order.add(dish, quantity)
  end

  def basket
    fail 'No orders' unless order
    order.show_basket
  end

  def complete_order(amount)
    fail 'No orders' unless order
    fail 'Amount given no correct' unless correct_amount?(amount)
    # 'invia messaggio'
    self.order = nil
  end

  private

  attr_writer :menu
  attr_accessor :order_klass, :order

  def new_order
    self.order = order_klass.new(menu)
  end

  def correct_amount?(amount)
    order.total == amount
  end

end

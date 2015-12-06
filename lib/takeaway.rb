require_relative 'menu'
require_relative 'order'
require_relative 'text_provider'

class TakeAway

  attr_reader :menu, :text_provider

  def initialize(args)
    self.menu = args[:menu]
    self.order_klass = args[:order_klass]
    self.text_provider = args[:text_provider_klass].new(args[:config])
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
    text_provider.deliver
    self.order = nil
  end

  private

  attr_writer :menu, :text_provider
  attr_accessor :order_klass, :order

  def new_order
    self.order = order_klass.new(menu)
  end

  def correct_amount?(amount)
    order.total == amount
  end

end

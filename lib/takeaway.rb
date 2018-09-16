require 'menu'
require 'order'
require 'sms'

class Takeaway
  def initialize(config)
    @menu = config.fetch(:menu, Menu.new)
    @sms = config.fetch(:sms, SMS.new)
    @order = config.fetch(:order, Order.new(sms))
  end

  def dishes
    menu.dishes
  end

  def select_dish(dish, quantity)
    format_dish(order.select_dish(dish, quantity))
  end

  def total_price
    order.total
  end

  private

  attr_reader :menu, :order, :sms

  def format_dish(item)
    quantity = item[:quantity]
    dish = item[:dish]
    "#{quantity} * #{dish.name} = £#{dish.price}"
  end
end

require_relative "order"
require_relative 'menu'
require_relative 'sms'

class Takeaway

  def initialize(menu:, config:, order: nil, sms: nil)
    @menu = menu
    @order = order || Order.new(menu)
    @sms = sms || SMS.new(config)
  end

  def display_menu
    @menu.display_menu 
  end

  def place_order(dishes)
    add_dishes(dishes)
    sms.deliver
    order.total
  end
#   def order(dish, quantity)
#    @order.to_order(dish, quantity)
#     "#{quantity} #{dish}(s) added to order"
#   end
private

  attr_reader :menu, :order, :sms

  def add_dishes(dishes)
    dishes.each { |dish, quantity| order.add(dish, quantity) }
  end 

end



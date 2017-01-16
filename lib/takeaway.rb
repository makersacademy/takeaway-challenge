require_relative 'menu'
require_relative 'order'
require_relative 'sms'

class Takeaway

attr_reader :price, :current_order

  def initialize(menu:, config:, order: nil, sms: nil)
     @menu = menu
     @order = order || Order.new(menu)
     @sms = sms || SMS.new

  end


  def place_order(dishes)
    add_dishes(dishes)
    sms.deliver
    order.total
  end

  def list_dishes
    menu.show_menu
  end


private

attr_reader :menu, :order, :sms


  def add_dishes(dishes)
    dishes.each do |dish, quantity|
      order.add(dish, quantity)
    end
  end

end

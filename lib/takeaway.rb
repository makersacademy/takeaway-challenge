require 'order'
require 'text_message'

class Takeaway

  attr_reader :menu, :order, :text_message

  def initialize(menu:, order: nil, text_message: nil)
    @menu = menu
    @order = order || Order.new(menu)
    @text_message = text_message || TextMessage.new
  end

  def view_menu
    menu.view
  end

  def make_order(dishes)
    add_dishes(dishes)
    text_message.deliver
    order.total
  end

  def add_dishes(dishes)
    dishes.each do |dish, quantity|
      order.add(dish, quantity)
    end
  end
end

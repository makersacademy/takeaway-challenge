require_relative 'order'
require_relative 'text_message'

class Takeaway

attr_reader :menu, :order, :text_message

  def initialize(menu:, order: nil, text_message: nil)
    @menu = menu
    @order = order || Order.new(menu)
    @text_message = text_message || TextMessage.new
  end

  def show_menu
    menu.to_string
  end

  def place_order(items)
    items.each do |item, quantity|
      order.add_item(item, quantity)
    end
    text_message.deliver
    order.total_amount
  end



end

require_relative 'order'
require_relative 'deliverymessage'

class Menu

  attr_reader :menu_view

  def initialize(neworder = Order,deliverymessage = DeliveryMessage)
    @menu_view = {'eggs' => 4,'bacon' => 3,'toast' => 4}
    @order_class = neworder
    @deliverymessage = deliverymessage
  end

  def view_menu
    @menu_view
  end

  def review
    raise 'You must order first' if @order.nil?
    @order.review_order
  end

  def order_item(item)
    @order ||= @order_class.new
    value = menu_view[item]
    @order.new_order(item,value)
  end

  def finish_order
    raise 'You must order first' if @order.nil?
    @order.completed
    @message = @deliverymessage.new
    @message.send_message
  end

end

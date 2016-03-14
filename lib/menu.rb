require_relative 'order'
require_relative 'deliverymessage'

class Menu

  attr_reader :menu_view

  def initialize(new_order = Order,delivery_message = DeliveryMessage)
    @menu_view = {'eggs' => 4,'bacon' => 3,'toast' => 4}
    @order_class = new_order
    @delivery_message = delivery_message
  end

  def view_menu
    @menu_view
  end

  def review
    raise 'You must order first' if @order.nil?
    @order.review_order
  end

  def order_item(item,quantity=1)
    @order ||= @order_class.new
    quantity.times do
      value = menu_view[item]
      @order.new_order(item,value)
    end
  end

  def finish_order
    raise 'You must order first' if @order.nil?
    @order.completed
    @message = @delivery_message.new
    @message.send_message
  end

end

class Customer

  attr_reader :order, :current_order

  def initialize(order_klass)
    @order = order_klass
  end

  def new_order
    create_new_order
    look_at_menu
  end


  def place_order(*order_numbers)
    self.current_order.take(*order_numbers)
  end

  def finish_order(send_message_klass = SendMessage.new)
    show_current_order
    send_text(send_message_klass)
  end

  private
  def send_text(send_message_klass)
    send_message_klass.send
  end

  def show_current_order
    self.current_order.order
  end

  def create_new_order
    @current_order = order.new
  end

  def look_at_menu
    self.current_order.show_menu
  end

end

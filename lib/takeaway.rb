class Takeaway

  attr_reader :menu, :current_order

  def initialize(menu)
    @menu = menu
    @current_order = nil
  end

  def start_new(order)
    @current_order = order
  end

  def confirm
    raise "No current order." if @current_order.nil?
    @current_order.complete?
  end

  def send_delivery(message)
    @current_order = nil
    message.send
  end

end

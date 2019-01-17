class Takeaway

  attr_reader :messager, :order

  def initialize(messager = Messager.new)
    @messager = messager
    @order = nil
  end

  def new_order(order)
    @order = order
  end

  def complete_order
    fail 'No order made!' unless order
    messager.send_message("Thank you for your order: #{order.total}."\
      " Your order will arrive at #{time.strftime("%H:%M")}")
  end

private
  def time
    Time.new.utc + 3600
  end
end

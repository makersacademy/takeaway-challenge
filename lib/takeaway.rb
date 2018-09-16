class Takeaway

  attr_reader :messager, :order

  def initialize(messager = Messager.new, order = Order.new)
    @messager = messager
    @order = order
  end

  def complete_order
    messager.send_message("Thank you for your order: #{order.total}")
  end
end

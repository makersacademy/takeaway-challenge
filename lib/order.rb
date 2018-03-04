class Order

  attr_reader :current_order, :final_order

  def initialize(verify)
    @verify = verify
    @current_order = []
    # @order_price = 0
  end

  def order_item(item)
    @current_order << item
    # @order_price += item[:price]
  end

  def remove_item(item)
   @current_order.delete(item)
   # @order_price += item[:price]
  end

  def confirm_order
    @verify.verify_order
  end


end

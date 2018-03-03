class Order

  attr_reader :current_order

  def initialize
    @current_order = []
    # @user_item = nil
  end

  def order_item(item)
    @current_order << item.to_s
  end

  def remove_item(item)
   @current_order.delete(item.to_s)
  end
end

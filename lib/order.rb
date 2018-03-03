class Order

  attr_reader :current_order, :final_order

  def initialize
    @current_order = []
    @final_order = []
    # @user_item = nil
  end

  def order_item(item)
    @current_order << item
  end

  def remove_item(item)
   @current_order.delete(item)
  end

  def confirm_order

  end


end

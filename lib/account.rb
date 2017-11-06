class Account
  def initialize(name)
    @name = name
    @order = Order.new
    @order_history = []
  end

  def new_order
    
  end

  def confirm
    @order.show_list
  end

  def send_confirmation
  end


end

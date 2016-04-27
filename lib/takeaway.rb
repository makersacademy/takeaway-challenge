class Takeaway
  attr_reader :menu, :current_order

  def initialize(menu = Menu.new, current_order = Order, messenger = Messenger.new)
    @menu = menu
    @current_order = current_order.new
    @order_class = current_order
    @messenger = messenger
  end

  def read_menu
    @menu.read
  end

  def order(dish, qty = 1)
    @current_order.select(dish, qty)
  end

  def basket
    @current_order.basket
  end

  def summary
    @current_order.summary
  end

  def confirm
    @messenger.confirm
    @current_order = @order_class.new
  end

private

    def qty_tracker
      @order.qty_tracker
    end

end

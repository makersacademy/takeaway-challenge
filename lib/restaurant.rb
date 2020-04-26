class Restaurant

  attr_reader :menu, :order

  def initialize(menu = Menu.new, order = Order.new, text = Text.new)
    @menu = menu
    @order = order
    @text = text
  end

  def view_menu
    @menu.print_menu
  end

  def select_dish(dish, qty)
    @order.add_to_basket(dish, qty)
  end

  def amend_basket(dish, qty)
    @order.remove_from_basket(dish, qty)
  end

  def view_basket
    @order.basket_total
  end

  def place_order
    @order.prepare_order
  end

  def send_text
    @text.send_sms if ready?
  end

  private

  def ready?
    @order.basket.has_key? :ready
  end
end

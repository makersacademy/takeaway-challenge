class Restaurant
  def initialize(order = Order.new, text = Text.new)
    @dishes = Dishes.new
    @order = order
    @text = text
  end

  def place_order
    @order.select_dishes
  end

  def list_dishes
    @dishes.list_menu
  end

  def bill
    @order.summarised_bill
  end

  def send_text
    @text.send_message
  end
end

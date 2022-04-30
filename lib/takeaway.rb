class Takeaway
  attr_reader :menu, :current_order, :text

  def initialize(menu = Menu.new, current_order = Order.new, text = Text.new)
    @menu = menu
    @current_order = current_order
    @text = text
  end

  def display_menu
    menu.display_available_dishes
  end

  def add_to_order(dishes)
    current_order.add_to_basket(dishes)
  end

  def place_order
    current_order.complete_order
    text.send_completion_message
  end
end
class Takeaway
  STANDARD_DELIVERY_TIMEFRAME = 3600

  def initialize(
    menu = Menu.new,
    current_order = Order.new,
    text = Text.new
  )
    @menu = menu
    @current_order = current_order
    @text = text
  end

  def display_menu
    menu.display_available_dishes
  end

  def add_to_order(*dishes) # {'pizza': 9.50}, {'pasta': 8.20}
    current_order.add_to_basket(dishes)
  end

  def check_order
    current_order.display_basket_and_total
  end

  def place_order
    current_order.complete_order(
      completion_time = current_time)
      
    text.send_completion_message(
      expected_delivery_time = standard_delivery_time)
  end

  private

  attr_reader :menu, :current_order, :text

  def standard_delivery_time
    time = current_time + STANDARD_DELIVERY_TIMEFRAME
    time.strftime("%H:%M")
  end

  def current_time
    Time.now
  end
end
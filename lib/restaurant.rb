class Restaurant
  CONFIRMATION = "Thanks! Your order will be delivered before"+
  "#{(Time.new + 3600).strftime('%H:%M')}".freeze
  EMPTY_ERR = 'You haven\'t ordered anything'.freeze

  def initialize menu, order_class = Order, messenger_class = TwilioAPI
    @menu = menu
    @order_class = order_class
    @messenger = messenger_class.new
    start_new_order
  end

  def view_menu
    @menu.view
  end

  def order dish, quantity
    @order.add(dish, quantity)
  end

  def order_summary
    @order.summary
  end

  def confirm_order
    fail EMPTY_ERR if order_summary[:total] == 0
    @messenger.send(CONFIRMATION)
    start_new_order
  end

  private
  def start_new_order
    @order = @order_class.new(@menu)
  end

end

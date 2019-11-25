class Takeaway
  def initialize(menu, order_class = Order, messenger = Messenger.new)
    @menu = menu
    @order_class = order_class
    @messenger = messenger
  end

  def run
    order = @order_class.new @menu
    confirm_order order
    send_message
  end

  private

  def confirm_order order
    input = check_summary order
    return if input == "y"

    order.update_order
    confirm_order order
  end
  
  def check_summary order
    puts order.summary
    print "Is this order correct? [y/n]: "
    STDIN.gets.chomp
  end

  def send_message
    print "Please enter a number to send a confirmation to: "
    number = STDIN.gets.chomp
    body = "Thank you! Your order was placed and will be delivered before "
    body << (Time.now + 3600).strftime('%H:%M')
    @messenger.send_message(number, body)
  end
end

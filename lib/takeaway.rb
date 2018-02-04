class Takeaway

  attr_reader :menu, :order, :message

  def initialize(menu = Menu.new, order = Order.new, message = Message.new)
    @menu = menu
    @order = order
    @message = message
  end

  def show_menu
    @menu.print_menu
  end

  def add_dish(dish, quantity = 1)
    @order.add_to_order(dish, quantity)
    puts "#{quantity} x #{dish} added to your order."
  end

  def show_total
    puts subtotals
    puts "Your total is £#{'%.2f' % @order.total_cost}"
  end

  def complete_order(phone_number)
    @message.send_sms(phone_number)
  end

  private

  def subtotals
    @order.subtotals
  end

end

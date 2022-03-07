require './lib/menu'
require './lib/order'
require './lib/notification'


class Takeaway

  def initialize(menu = Menu.new)
    @menu = menu
  end

  def menu
    @menu.display
  end

  def order
    @order = Order.new(@menu)
    order_input_loop
    @order.time_of_order = Time.now
    confirmation if @order_complete
  end

  def confirmation
    text_message = Notification.new(@order.time)
    text_message.send
  end

  private

  def order_input_loop
    while true
      puts "Enter the number of the dish to add, type 'finish or cancel' to end order"
      user_input = gets.chomp
      break if user_input.downcase == 'finish' || user_input.downcase == 'cancel'
      @order.add(user_input.to_i)
      puts "Order Total £#{@order.total}"
    end
    @order_complete = true if user_input.downcase == 'finish'
    @order_complete = false if user_input.downcase == 'cancel'
  end

end
require_relative 'messenger'
class Restaurant


  def initialize(order = Order.new, menu = Menu.new, messenger = Messenger.new)
    @order = order
    @menu = menu
    @messenger = messenger
  end

  def see_menu
    @menu.load_menu_from_file
    @menu.change_menu_to_string
  end

  def add_dish_to_orders(dish_index)
    dish = @menu.dishes[dish_index - 1]
    @order.add_dish(dish)
    "You have ordered option #{dish_index}"
  end

  def review_order
    "Your order total is £#{show_order_total}. You will receive a text shortly."
  end

  def submit_order
    show_order_total
    @messenger.send(get_order_confirmation_message)
    review_order
  end


  private

  def show_order_total
    @order.total_to_string
  end

  def get_order_confirmation_message
    t = Time.new
    t += 60 * 60
    "Thank you! Your order was placed and will be delivered before " + t.strftime("%R")
  end

end

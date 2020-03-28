require_relative 'menu'
require_relative 'notification'

class Order
  def initialize(menu = Menu.new, notification = Notification.new)
    @menu = menu
    @basket = []
    @notification = notification
  end

  def view_menu
    @menu.view
  end

  def add(dish_number)
    @basket << @menu.provide_dish(dish_number)
  end

  def basket
    BASKET_HEADER + basket_list + total
  end

  def place
    order_time = Time.now
    delivery_time = (order_time + 10 * 60).strftime("%R")
    @notification.send(delivery_time)
  end

  private

  BASKET_HEADER = "Your order:\n"

  def basket_list
    @basket.map { |dish| dish.details }.join("\n")
  end

  def total
    total = @basket.map { |dish| dish.price }.sum
    "\nTotal: £#{total}"
  end
end

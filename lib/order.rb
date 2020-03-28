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
    @notification.send(delivery_time(Time.now))
  end

  private

  BASKET_HEADER = "Your order:\n"

  def delivery_time(time)
    hour_from_now = time + 10 * 60
    hour_from_now.strftime("%R")
  end

  def basket_list
    @basket.map { |dish| dish.details }.join("\n")
  end

  def total
    total = @basket.map { |dish| dish.price }.sum
    "\nTotal: £#{total}"
  end
end

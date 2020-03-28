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
    delivery_time = calculate_delivery_time(Time.now)
    @notification.send(delivery_time)
  end
  
  private
  
  ONE_HOUR = 60 * 60
  BASKET_HEADER = "Your order:\n"

  def calculate_delivery_time(time)
    hour_from_now = time + ONE_HOUR
    time_as_24(hour_from_now)
  end

  def time_as_24(time)
    time.strftime("%R")
  end

  def basket_list
    @basket.map { |dish| dish.details }.join("\n")
  end

  def total
    total = @basket.map { |dish| dish.price }.sum
    "\nTotal: £#{total}"
  end
end

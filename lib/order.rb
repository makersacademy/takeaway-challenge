require_relative 'menu'
require_relative 'notification'

class Order
  def initialize(menu = Menu.new, notification = Notification.new)
    @menu = menu
    @notification = notification
  end
  
  def view_menu
    @menu.view
  end

  def place(*dish_quantity_list, total)
    order_status = check_order(dish_quantity_list, total)
    send_notification
    order_status
  end
  
  private

  def send_notification
    delivery_time = calculate_delivery_time(Time.now)
    @notification.send(delivery_time)
  end

  def check_order(dish_quantity_list, total)
    dishes = get_dishes(dish_quantity_list)
    quantities = get_quantities(dish_quantity_list)
    raise 'Incorrect arguments: each dish is followed by quantity, finally total cost' unless dishes.size == quantities.size
    raise 'Total provided does not match calculated total' unless total_price(dish_quantity_list) == total
    
    true
  end

  def get_dishes(dish_quantity_list)
    dish_quantity_list.filter { |i| i.is_a?(String) }
  end

  def get_quantities(dish_quantity_list)
    dish_quantity_list.filter { |i| i.is_a?(Integer) }
  end

  def total_price(dish_quantity_list)
    dishes = get_dishes(dish_quantity_list)
    quantities = get_quantities(dish_quantity_list)
    prices = dishes.map { |i| @menu.provide_price(i) }
    prices.zip(quantities)
      .map { |price, quantity| price * quantity }
      .sum
  end

  ONE_HOUR = 60 * 60

  def calculate_delivery_time(time)
    hour_from_now = time + ONE_HOUR
    time_as_24(hour_from_now)
  end

  def time_as_24(time)
    time.strftime("%R")
  end
end

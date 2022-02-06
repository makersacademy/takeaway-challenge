class FoodOrder

  def initialize
    @ordered_dishes = {}
  end

  def order_dish(dish, quantity)
    raise "Quantity ordered needs to be greater than zero" if quantity < 1
    dish_in_order?(dish) ? update_dish(dish, quantity) : add_dish(dish, quantity)
  end

  def show_order
    format_order
  end

  def confirm_order(messaging)
    messaging.message = confirmation_message
    messaging.send
  end

  private 

  def delivery_time 
    time_plus_hour = Time.now + 1*60*60 
    "#{time_plus_hour.hour}:#{time_plus_hour.min}"
  end

  def confirmation_message
    "Thank you! Your order was placed and will be delivered before #{delivery_time}"
  end

  def add_dish(dish, quantity)
    @ordered_dishes[dish] = quantity
  end

  def update_dish(dish, quantity)
    @ordered_dishes[dish] += quantity
  end

  def dish_in_order?(dish)
    @ordered_dishes.key?(dish)
  end

  def calculate_total_price
    @ordered_dishes.inject(0) do |order_total, (dish, quantity)|
      order_total + (dish.price * quantity)
    end    
  end

  def format_order
    order = ""
    @ordered_dishes.each do |ordered_dish, quantity_ordered| 
      order += format_ordered_item(ordered_dish, quantity_ordered)
    end
    order += format_price
    order.chomp
  end

  def format_ordered_item(ordered_dish, quantity_ordered)
    "Dish: #{ordered_dish.name}, Qty: #{quantity_ordered}\n"
  end

  def format_price
    "Total Price: £#{'%.2f' % total_price}"
  end
  
  def total_price
    calculate_total_price
  end
end

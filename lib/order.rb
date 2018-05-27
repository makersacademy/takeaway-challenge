class Order 

  attr_reader :current_items

  def initialize(restaurant, confirmation = Confirmation.new)
    @current_items = []
    @restaurant = restaurant
    @confirm = confirmation
  end

  def add_item(item, quantity)
    @current_items << [item, quantity]
  end

  def submit(suspected_total)
    total = calculate_order_price
    @suspected_total = suspected_total
    raise "The suspected total is wrong" if total != suspected_total
    @confirm.send_text_message("Your order total is confirmed, total cost is #{total} and will be delivered by 11am")
    total
  end

  def calculate_order_price 
    total = 0
    @current_items.each do |order_line|
      price = @restaurant.menu_items[order_line[0]]
      this_line_total = price * order_line[1]
      total += this_line_total
    end
    return total
  end

   def delivery_time
    now = Time.now
    now_hour = now.strftime("%I")
    now_minute = now.strftime("%M")
    now_ampm = now.strftime("%p")
    delivery_time = "at #{now_hour.to_i + 1}:#{now_minute}#{now_ampm}"
  end
end
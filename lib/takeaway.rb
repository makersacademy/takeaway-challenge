class Takeaway

  DEFAULT_DISHES = {
    "Pizza" => Dish.new('Pizza', 1.50),
    "Sushi" => Dish.new('Sushi', 16.00)
  }

  def initialize(dishes = DEFAULT_DISHES, order_class = Order)
    @dishes = dishes
    @order_class = order_class
  end

  def dishes
    @dishes.values.reduce('') do |memo, dish|
      "#{memo}#{dish.to_s}\n"
    end
  end

  def order(order_string, customer_total, time = Time.now)
    @current_order = @order_class.new(time)
    process_order(order_string, customer_total)
    return order_success
  end

  private

  def process_order(order_string, customer)
    order_arr = split_order_string(order_string)
    order_arr.each_cons(2) do |item_arr| 
      item_arr[1].to_i.times { @current_order.add(get_dish(item_arr[0])) }
    end
  end

  def split_order_string(order_string)
    order_string.split(' *')
  end

  def get_dish(string)
    @dishes[string]
  end

  def order_success
    "Thank you! Your order was placed and will be delivered before #{@current_order.delivery_time}. You will also receive a text message with these details"
  end


end

class Order
  def initialize(dish_class = Dish)
    @order_list = []
    @dish_class = dish_class
  end

  def add_order_line(dish, quantity)
    raise 'not a dish' unless dish.is_a? @dish_class
    raise 'quantity less than 1 not allowed' unless quantity.positive?

    order_line = {
      dish: dish.name,
      price: dish.price,
      quantity: quantity,
      line_total: quantity * dish.price.to_f
    }
    @order_list << order_line
    @order_list
  end

  def calculate_total
    if @order_list.empty?
      0
    else
      @order_list.map { |line| line[:line_total] }.reduce(:+)
    end
  end

  def submit_order(sender_class = TextSender)
    raise "Can't submit an empty order" unless @order_list.any?
    sender = sender_class.new
    time = calculate_time
    message = "Thank you! Your order was placed and will be
    delivered before #{time}"
    sender.send(message)
    "Order Confirmed"
  end

  private
  def calculate_time
    time = Time.now
    "#{time.hour + 1}:#{time.min}"
  end
end

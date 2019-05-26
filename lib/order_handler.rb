class OrderHandler

  ERROR_MESSAGE = "Sorry, your order was invalid."

  def initialize(menu, order_class)
    @menu = menu
    @order_class = order_class
  end

  def handle_order(order_string, customer_total, time = Time.now)
    create_new_order(time)
    add_all_to_order(order_string)
    fail(ERROR_MESSAGE) if invalid_total?(customer_total)
    order_success
  end

  private

  def create_new_order(time)
    @current_order = @order_class.new(time)
  end

  def add_all_to_order(order_string)
    order_arr = split_order_string(order_string)
    order_arr.each_cons(2) do |item_arr| 
      item_arr[1].to_i.times { @current_order.add(get_dish(item_arr[0])) }
    end
  end

  def split_order_string(order_string)
    order_items = order_string.split(', ')
    order_arr = []
    order_items.each { |item| order_arr.concat(item.split(' *')) }
    order_arr
  end 

  def get_dish(string)
    @menu.get(string) ? @menu.get(string) : fail(ERROR_MESSAGE)
  end

  def order_success
    "Thank you! Your order was placed and will be delivered before #{@current_order.delivery_time}. You will also receive a text message with these details"
  end

  def invalid_total?(customer_total)
    decimal_customer_total = BigDecimal(customer_total, 4) 
    @current_order.total != customer_total
  end


end